(* Bibliothèque pour produire du code x86_64

   2008 Jean-Christophe Filliâtre (CNRS)
   2013 Kim Nguyen (Université Paris Sud)

  Adições:
    let dil: register = "%dil"
    let movzbq a b = ins "movzbq %a, %a" a () b ()

    let cmpq a b = ins "cmpq %a, %a" a () b ()
    let testq a b = ins "test %a, %a" a () b ()

    let setcc a = ins "setcc %a"  a ()
    let cmovcc  a b = ins "cmovcc %a, %a"  a() b ()
    let jcc  (z: label) = ins "jcc %s"  z

    onde cc = [ e | ne | s | ns | g | ge | l | le ]

    *)

open Format

type register =  string
let rax: register = "%rax"
let rbx: register = "%rbx"
let rcx: register = "%rcx"
let rdx: register = "%rdx"
let rsi: register = "%rsi"
let rdi: register = "%rdi"
let rbp: register = "%rbp"
let rsp: register = "%rsp"
let r8 : register = "%r8"
let r9 : register = "%r9"
let r10: register = "%r10"
let r11: register = "%r11"
let r12: register = "%r12"
let r13: register = "%r13"
let r14: register = "%r14"
let r15: register = "%r15"
let dil: register = "%dil"

type label = string

type operand = formatter -> unit -> unit

let reg r = fun fmt () -> fprintf fmt "%s" r
let imm i = fun fmt () -> fprintf fmt "$%i" i
let ind ?(ofs=0) ?index ?(scale=1) r = fun fmt () -> match index with
  | None -> fprintf fmt "%d(%s)" ofs r
  | Some r1 -> fprintf fmt "%d(%s,%s,%d)" ofs r r1 scale
let lab (l: label) = fun fmt () -> fprintf fmt "%s" l
let ilab (l: label) = fun fmt () -> fprintf fmt "$%s" l

type 'a asm =
  | Nop
  | S of string
  | Cat of 'a asm * 'a asm

type text = [`text ] asm
type data = [`data ] asm

let buf = Buffer.create 17
let fmt = formatter_of_buffer buf
let ins x =
  Buffer.add_char buf '\t';
  kfprintf (fun fmt ->
    fprintf fmt "\n";
    pp_print_flush fmt ();
    let s = Buffer.contents buf in
    Buffer.clear buf;
    S s
  ) fmt x

let pr_list fmt pr = function
  | []      -> ()
  | [i]     -> pr fmt i
  | i :: ll -> pr fmt i; List.iter (fun i -> fprintf fmt ", %a" pr i) ll

let pr_ilist fmt l =
  pr_list fmt (fun fmt i -> fprintf fmt "%i" i) l

let pr_alist fmt l =
  pr_list fmt (fun fmt (a : label) -> fprintf fmt "%s" a) l

let movq a b = ins "movq %a, %a" a () b ()
let movzbq a b = ins "movzbq %a, %a" a () b ()

let leaq op r = ins "leaq %a, %s" op () r

let addq a b = ins "addq %a, %a" a () b ()
let subq a b = ins "subq %a, %a" a () b ()
let imulq a b = ins "imulq %a, %a" a () b ()
let idivq a = ins "idivq %a" a ()
let negq a = ins "negq %a" a ()

let andq a b = ins "andq %a, %a" a () b ()
let orq  a b = ins "orq %a, %a"  a () b ()
let xorq a b = ins "xorq %a, %a" a () b ()
let notq a = ins "notq %a" a ()

let cmpq a b = ins "cmpq %a, %a" a () b ()
let testq a b = ins "test %a, %a" a () b ()

let sete  a = ins "sete %a"  a ()
let setne a = ins "setne %a" a ()
let sets  a = ins "sets %a"  a ()
let setns a = ins "setns %a" a ()
let setg  a = ins "setg %a"  a ()
let setge a = ins "setge %a" a ()
let setl  a = ins "setl %a"  a ()
let setle a = ins "setle %a" a ()

let cmove  a b = ins "cmove %a, %a"  a() b () 
let cmovne a b = ins "cmovne %a, %a" a() b () 
let cmovs  a b = ins "cmovs %a, %a"  a() b () 
let cmovns a b = ins "cmovns %a, %a" a() b () 
let cmovg  a b = ins "cmovg %a, %a"  a() b () 
let cmovge a b = ins "cmovge %a, %a" a() b () 
let cmovl  a b = ins "cmovl %a, %a"  a() b () 
let cmovl1 a b = ins "cmovl1 %a, %a" a() b () 

let je  (z: label) = ins "je %s"  z
let jne (z: label) = ins "jne %s" z
let js  (z: label) = ins "js %s"  z
let jns (z: label) = ins "jns %s" z
let jg  (z: label) = ins "jg %s"  z
let jge (z: label) = ins "jge %s" z
let jl  (z: label) = ins "jl %s"  z
let jl1 (z: label) = ins "jl1 %s" z

let jmp  (z: label) = ins "jmp %s" z
let call (z: label) = ins "call %s" z
let ret = ins "ret"

let nop = Nop

let label (s : label) = S (s ^ ":\n")
let glabel (s: label) = S ("\t.globl\t" ^ s ^ "\n" ^ s ^ ":\n")

let comment s = S ("#" ^ s ^ "\n")

let align n = ins ".align %i" n

let dbyte l = ins ".byte %a" pr_ilist l
let dint  l = ins ".int %a" pr_ilist l
let dword l = ins ".word %a" pr_ilist l
let dquad l = ins ".quad %a" pr_ilist l
let string s = ins ".string %S" s

let address l = ins ".quad %a" pr_alist l
let space n = ins ".space %d" n

let inline s = S s
let (++) x y = Cat (x, y)

let pushq r = ins "pushq %s" r
let popq  r = ins "popq %s" r

type program = {
  text : [ `text ] asm;
  data : [ `data ] asm;
}

let rec pr_asm fmt = function
  | Nop          -> ()
  | S s          -> fprintf fmt "%s" s
  | Cat (a1, a2) -> pr_asm fmt a1; pr_asm fmt a2

let print_program fmt p =
  fprintf fmt ".text\n";
  pr_asm fmt p.text;
  fprintf fmt ".data\n";
  pr_asm fmt p.data;
  pp_print_flush fmt ()

let print_in_file ~file p =
  let c = open_out file in
  let fmt = formatter_of_out_channel c in
  print_program fmt p;
  close_out c
