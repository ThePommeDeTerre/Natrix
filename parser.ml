
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | VAR
    | THEN
    | SET
    | SCOL
    | RP
    | RB
    | RANGE
    | PRINTINT
    | PRINTBOOL
    | PLUS
    | OR
    | NOT
    | MUL
    | MOD
    | MINUS
    | LP
    | LET
    | LB
    | INT
    | IN
    | IF
    | IDENT of (
# 7 "parser.mly"
       (string)
# 32 "parser.ml"
  )
    | FOR
    | EQ
    | EOF
    | ELSE
    | DO
    | DIV
    | CONST of (
# 5 "parser.mly"
       (Ast.constant)
# 43 "parser.ml"
  )
    | COL
    | CMP of (
# 6 "parser.mly"
       (Ast.binop)
# 49 "parser.ml"
  )
    | BOOL
    | AND
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState76
  | MenhirState71
  | MenhirState68
  | MenhirState65
  | MenhirState63
  | MenhirState58
  | MenhirState56
  | MenhirState53
  | MenhirState49
  | MenhirState44
  | MenhirState35
  | MenhirState33
  | MenhirState31
  | MenhirState29
  | MenhirState27
  | MenhirState25
  | MenhirState23
  | MenhirState21
  | MenhirState19
  | MenhirState15
  | MenhirState13
  | MenhirState10
  | MenhirState9
  | MenhirState8
  | MenhirState7
  | MenhirState3
  | MenhirState0

# 1 "parser.mly"
  
  open Ast

# 101 "parser.ml"

let rec _menhir_goto_stmts : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmts -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv265 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 112 "parser.ml"
        ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv261 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 122 "parser.ml"
            ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv259 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 129 "parser.ml"
            ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), (id : (
# 7 "parser.mly"
       (string)
# 134 "parser.ml"
            ))), _, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)), _, (s : 'tv_stmts)) = _menhir_stack in
            let _10 = () in
            let _8 = () in
            let _7 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_stmt = 
# 59 "parser.mly"
                                                ( Sforeach (id, e1, e2, s) )
# 145 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv260)) : 'freshtv262)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv263 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 155 "parser.ml"
            ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)) : 'freshtv266)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv269 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv267 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_stmt)), _, (xs : 'tv_stmts)) = _menhir_stack in
        let _v : 'tv_stmts = 
# 48 "parser.mly"
                       ( x :: xs )
# 168 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)) : 'freshtv270)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv283 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv279 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ELSE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv275 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | LB ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv271 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | FOR ->
                        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState76
                    | IDENT _v ->
                        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
                    | IF ->
                        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState76
                    | PRINTBOOL ->
                        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState76
                    | PRINTINT ->
                        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState76
                    | VAR ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState76
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv272)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv273 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts))) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)) : 'freshtv276)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv277 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)) : 'freshtv280)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv281 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)) : 'freshtv284)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv291 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv287 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv285 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (e : 'tv_expr)), _, (s1 : 'tv_stmts)), _, (s2 : 'tv_stmts)) = _menhir_stack in
            let _10 = () in
            let _8 = () in
            let _7 = () in
            let _6 = () in
            let _4 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_stmt = 
# 57 "parser.mly"
                                                ( Sif (e, s1, s2) )
# 255 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)) : 'freshtv288)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv289 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)) : 'freshtv292)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv301 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv299 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (p : 'tv_stmts)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 39 "parser.mly"
      (Ast.program)
# 281 "parser.ml"
            ) = 
# 43 "parser.mly"
                ( p )
# 285 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv297) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 39 "parser.mly"
      (Ast.program)
# 293 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv295) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 39 "parser.mly"
      (Ast.program)
# 301 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv293) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 39 "parser.mly"
      (Ast.program)
# 309 "parser.ml"
            )) : (
# 39 "parser.mly"
      (Ast.program)
# 313 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv294)) : 'freshtv296)) : 'freshtv298)) : 'freshtv300)) : 'freshtv302)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv303 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)) : 'freshtv306)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmt -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv257 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | IDENT _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | IF ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | PRINTBOOL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | PRINTINT ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | VAR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | EOF | RB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv255 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_stmt)) = _menhir_stack in
        let _v : 'tv_stmts = 
# 47 "parser.mly"
                       ( [x] )
# 358 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv258)

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run29 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run31 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> (
# 6 "parser.mly"
       (Ast.binop)
# 501 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run35 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35

and _menhir_goto_types : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_types -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv247 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 556 "parser.ml"
        ))) * _menhir_state * 'tv_types) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv243 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 566 "parser.ml"
            ))) * _menhir_state * 'tv_types) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONST _v ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
            | IDENT _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
            | LET ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState7
            | LP ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState7
            | MINUS ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7
            | NOT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7) : 'freshtv244)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv245 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 594 "parser.ml"
            ))) * _menhir_state * 'tv_types) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)) : 'freshtv248)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv253 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 603 "parser.ml"
        ))) * _menhir_state * 'tv_types) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv249 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 613 "parser.ml"
            ))) * _menhir_state * 'tv_types) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONST _v ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | IDENT _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | LET ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LP ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | MINUS ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | NOT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15) : 'freshtv250)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv251 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 641 "parser.ml"
            ))) * _menhir_state * 'tv_types) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)) : 'freshtv254)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv105 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 657 "parser.ml"
        ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv101 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 673 "parser.ml"
            ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONST _v ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
            | IDENT _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
            | LET ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | LP ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | MINUS ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | NOT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv102)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv103 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 711 "parser.ml"
            ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)) : 'freshtv106)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv111 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AND | CMP _ | DO | IN | MOD | OR | PLUS | RANGE | RP | SCOL | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv107 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 81 "parser.mly"
        ( Badd )
# 737 "parser.ml"
              
            in
            
# 72 "parser.mly"
                               ( Ebinop (o, e1, e2) )
# 743 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv109 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)) : 'freshtv112)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv113 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
        let _10 = () in
        let _v : 'tv_expr = let o =
          let _1 = _10 in
          
# 84 "parser.mly"
        ( Bmul )
# 765 "parser.ml"
          
        in
        
# 72 "parser.mly"
                               ( Ebinop (o, e1, e2) )
# 771 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv114)) : 'freshtv116)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AND | CMP _ | DO | IN | MINUS | MOD | OR | PLUS | RANGE | RP | SCOL | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv117 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 82 "parser.mly"
        ( Bsub )
# 794 "parser.ml"
              
            in
            
# 72 "parser.mly"
                               ( Ebinop (o, e1, e2) )
# 800 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv118)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv119 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)) : 'freshtv122)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AND | CMP _ | DIV | DO | IN | MINUS | MOD | OR | PLUS | RANGE | RP | SCOL | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv123 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 83 "parser.mly"
        ( Bdiv )
# 828 "parser.ml"
              
            in
            
# 72 "parser.mly"
                               ( Ebinop (o, e1, e2) )
# 834 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv124)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv125 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)) : 'freshtv128)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv133 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | AND | DO | IN | OR | RANGE | RP | SCOL | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv129 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 88 "parser.mly"
        (Bor)
# 872 "parser.ml"
              
            in
            
# 72 "parser.mly"
                               ( Ebinop (o, e1, e2) )
# 878 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv130)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv131 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)) : 'freshtv134)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv139 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | AND | CMP _ | DO | IN | MOD | OR | RANGE | RP | SCOL | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv135 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 85 "parser.mly"
        ( Bmod)
# 912 "parser.ml"
              
            in
            
# 72 "parser.mly"
                               ( Ebinop (o, e1, e2) )
# 918 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv136)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv137 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)) : 'freshtv140)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv145 * _menhir_state * 'tv_expr) * (
# 6 "parser.mly"
       (Ast.binop)
# 933 "parser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | AND | DO | IN | OR | RANGE | RP | SCOL | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv141 * _menhir_state * 'tv_expr) * (
# 6 "parser.mly"
       (Ast.binop)
# 953 "parser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), (c0 : (
# 6 "parser.mly"
       (Ast.binop)
# 958 "parser.ml"
            ))), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _v : 'tv_expr = let o =
              let c = c0 in
              
# 86 "parser.mly"
        (c)
# 965 "parser.ml"
              
            in
            
# 72 "parser.mly"
                               ( Ebinop (o, e1, e2) )
# 971 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv142)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv143 * _menhir_state * 'tv_expr) * (
# 6 "parser.mly"
       (Ast.binop)
# 981 "parser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)) : 'freshtv146)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv151 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 990 "parser.ml"
        ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | AND | DO | IN | OR | RANGE | RP | SCOL | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv147 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1012 "parser.ml"
            ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), (id : (
# 7 "parser.mly"
       (string)
# 1017 "parser.ml"
            ))), _, (t : 'tv_types)), _, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 76 "parser.mly"
                               (Elet (id, t, e1, e2))
# 1026 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv148)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv149 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1036 "parser.ml"
            ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)) : 'freshtv152)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv157 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | AND | DO | IN | RANGE | RP | SCOL | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv153 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 87 "parser.mly"
        (Band)
# 1070 "parser.ml"
              
            in
            
# 72 "parser.mly"
                               ( Ebinop (o, e1, e2) )
# 1076 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv154)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv155 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)) : 'freshtv158)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv165 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv161 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv159 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 77 "parser.mly"
                               (e)
# 1120 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv160)) : 'freshtv162)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv163 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)) : 'freshtv166)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv169 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_expr = 
# 74 "parser.mly"
                               ( Eunop (Uneg, e) )
# 1140 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)) : 'freshtv170)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | AND | DO | IN | OR | RANGE | RP | SCOL | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv171 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_expr = 
# 73 "parser.mly"
                               ( Eunop (Unot, e))
# 1169 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv172)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv173 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)) : 'freshtv176)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv183 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1184 "parser.ml"
        ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | SCOL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv179 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1210 "parser.ml"
            ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv177 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1217 "parser.ml"
            ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), (id : (
# 7 "parser.mly"
       (string)
# 1222 "parser.ml"
            ))), _, (t : 'tv_types)), _, (e : 'tv_expr)) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_stmt = 
# 52 "parser.mly"
                                                ( Svar (id, t, e) )
# 1231 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv178)) : 'freshtv180)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv181 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1241 "parser.ml"
            ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)) : 'freshtv184)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv195 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv191 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SCOL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv187 * _menhir_state)) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv185 * _menhir_state)) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_stmt = 
# 54 "parser.mly"
                                                ( Sprint_int e )
# 1287 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv186)) : 'freshtv188)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv189 * _menhir_state)) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)) : 'freshtv192)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv193 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)) : 'freshtv196)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv207 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv203 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SCOL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv199 * _menhir_state)) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv197 * _menhir_state)) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_stmt = 
# 55 "parser.mly"
                                                ( Sprint_bool e )
# 1346 "parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv198)) : 'freshtv200)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv201 * _menhir_state)) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)) : 'freshtv204)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv205 * _menhir_state)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)) : 'freshtv208)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv217 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv213 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LB ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv209 * _menhir_state) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | FOR ->
                    _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | IDENT _v ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
                | IF ->
                    _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | PRINTBOOL ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | PRINTINT ->
                    _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | VAR ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv210)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv211 * _menhir_state) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)) : 'freshtv214)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv215 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)) : 'freshtv218)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv225 * _menhir_state * (
# 7 "parser.mly"
       (string)
# 1432 "parser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | SCOL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv221 * _menhir_state * (
# 7 "parser.mly"
       (string)
# 1458 "parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv219 * _menhir_state * (
# 7 "parser.mly"
       (string)
# 1465 "parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (id : (
# 7 "parser.mly"
       (string)
# 1470 "parser.ml"
            ))), _, (e : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_stmt = 
# 53 "parser.mly"
                                                ( Sset (id, e) )
# 1477 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)) : 'freshtv222)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv223 * _menhir_state * (
# 7 "parser.mly"
       (string)
# 1487 "parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)) : 'freshtv226)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv231 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1496 "parser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | RANGE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv227 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1522 "parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONST _v ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
            | IDENT _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
            | LET ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | LP ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | MINUS ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | NOT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65) : 'freshtv228)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv229 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1550 "parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)) : 'freshtv232)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv241 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1559 "parser.ml"
        ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | CMP _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | DO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv237 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1575 "parser.ml"
            ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LB ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv233 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1585 "parser.ml"
                ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | FOR ->
                    _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState68
                | IDENT _v ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
                | IF ->
                    _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState68
                | PRINTBOOL ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState68
                | PRINTINT ->
                    _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState68
                | VAR ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState68
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv234)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv235 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1613 "parser.ml"
                ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)) : 'freshtv238)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv239 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1634 "parser.ml"
            ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)) : 'freshtv242)
    | _ ->
        _menhir_fail ()

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv99) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_types = 
# 65 "parser.mly"
       (Tint)
# 1651 "parser.ml"
     in
    _menhir_goto_types _menhir_env _menhir_stack _menhir_s _v) : 'freshtv100)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv97) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_types = 
# 66 "parser.mly"
       (Tbool)
# 1665 "parser.ml"
     in
    _menhir_goto_types _menhir_env _menhir_stack _menhir_s _v) : 'freshtv98)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "parser.mly"
       (string)
# 1750 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv89 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1761 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | INT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv90)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv91 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1781 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)) : 'freshtv94)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "parser.mly"
       (string)
# 1796 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((id : (
# 7 "parser.mly"
       (string)
# 1806 "parser.ml"
    )) : (
# 7 "parser.mly"
       (string)
# 1810 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 71 "parser.mly"
                               ( Eident id )
# 1815 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv88)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "parser.mly"
       (Ast.constant)
# 1822 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv85) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : (
# 5 "parser.mly"
       (Ast.constant)
# 1832 "parser.ml"
    )) : (
# 5 "parser.mly"
       (Ast.constant)
# 1836 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 70 "parser.mly"
                               ( Econst c )
# 1841 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv86)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv31 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv35 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1863 "parser.ml"
        ))) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv37 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1872 "parser.ml"
        ))) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1881 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv41 * _menhir_state * (
# 7 "parser.mly"
       (string)
# 1890 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43 * _menhir_state) * _menhir_state * 'tv_expr))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv53 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1924 "parser.ml"
        ))) * _menhir_state * 'tv_types)) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * 'tv_expr) * (
# 6 "parser.mly"
       (Ast.binop)
# 1933 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv69 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1972 "parser.ml"
        ))) * _menhir_state * 'tv_types)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 1981 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv79 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2005 "parser.ml"
        ))) * _menhir_state * 'tv_types)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv81 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2014 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv84)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "parser.mly"
       (string)
# 2035 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv23 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2046 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | INT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv24)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv25 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2066 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)) : 'freshtv28)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CONST _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | IDENT _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | LET ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | LP ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | MINUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | NOT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv20)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CONST _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | IDENT _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | LET ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | LP ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MINUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | NOT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv16)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONST _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | IDENT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | LET ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | LP ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | MINUS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | NOT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "parser.mly"
       (string)
# 2176 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state * (
# 7 "parser.mly"
       (string)
# 2188 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CONST _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | IDENT _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | LET ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LP ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | MINUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | NOT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv12)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * _menhir_state * (
# 7 "parser.mly"
       (string)
# 2216 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "parser.mly"
       (string)
# 2233 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv3 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2244 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONST _v ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | IDENT _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | LET ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | LP ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | MINUS ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | NOT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv4)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv5 * _menhir_state) * (
# 7 "parser.mly"
       (string)
# 2272 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv6)) : 'freshtv8)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 39 "parser.mly"
      (Ast.program)
# 2299 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | IDENT _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PRINTBOOL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PRINTINT ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VAR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 233 "/home/raquel/.opam/4.07.0/lib/menhir/standard.mly"
  

# 2338 "parser.ml"
