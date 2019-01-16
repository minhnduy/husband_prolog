% target state
goal([0,0,0,0,0,0,0,1,1,1,1,1,1,1]).

% state description
% [bl, h1, h2, h3, w1, w2, w3, br, h10, h20, h30, w10, w20, w30]

% transport left -> right: one husband 
l_r_h([1,1,H2,H3,W1,W2,W3,0,0,H21,H31,W11,W21,W31],[0,0,H2,H3,W1,W2,W3,1,1,H21,H31,W11,W21,W31]).
l_r_h([1,H1,1,H3,W1,W2,W3,0,H11,0,H31,W11,W21,W31],[0,H1,0,H3,W1,W2,W3,1,H11,1,H31,W11,W21,W31]).
l_r_h([1,H1,H2,1,W1,W2,W3,0,H11,H21,0,W11,W21,W31],[0,H1,H2,0,W1,W2,W3,1,H11,H21,1,W11,W21,W31]).

% transport left -> right: two husbands 
l_r_hh([1,1,1,H3,W1,W2,W3,0,0,0,H31,W11,W21,W31],[0,0,0,H3,W1,W2,W3,1,1,1,H31,W11,W21,W31]).
l_r_hh([1,H1,1,1,W1,W2,W3,0,H11,0,0,W11,W21,W31],[0,H1,0,0,W1,W2,W3,1,H11,1,1,W11,W21,W31]).
l_r_hh([1,1,H2,1,W1,W2,W3,0,0,H21,0,W11,W21,W31],[0,0,H2,0,W1,W2,W3,1,1,H21,1,W11,W21,W31]).

% transport left -> right: one wife
l_r_w([1,H1,H2,H3,1,W2,W3,0,H11,H21,H31,0,W21,W31],[0,H1,H2,H3,0,W2,W3,1,H11,H21,H31,1,W21,W31]).
l_r_w([1,H1,H2,H3,W1,1,W3,0,H11,H21,H31,W11,0,W31],[0,H1,H2,H3,W1,0,W3,1,H11,H21,H31,W11,1,W31]).
l_r_w([1,H1,H2,H3,W1,W2,1,0,H11,H21,H31,W11,W21,0],[0,H1,H2,H3,W1,W2,0,1,H11,H21,H31,W11,W21,1]).

% transport left -> right: two wifes
l_r_ww([1,H1,H2,H3,1,1,W3,0,H11,H21,H31,0,0,W31],[0,H1,H2,H3,0,0,W3,1,H11,H21,H31,1,1,W31]).
l_r_ww([1,H1,H2,H3,W1,1,1,0,H11,H21,H31,W11,0,0],[0,H1,H2,H3,W1,0,0,1,H11,H21,H31,W11,1,1]).
l_r_ww([1,H1,H2,H3,1,W2,1,0,H11,H21,H31,0,W21,0],[0,H1,H2,H3,0,W2,0,1,H11,H21,H31,1,W21,1]).

% transport left -> right: husband and his's wife
l_r_hw([1,1,H2,H3,1,W2,W3,0,0,H21,H31,0,W21,W31],[0,0,H2,H3,0,W2,W3,1,1,H21,H31,1,W21,W31]).
l_r_hw([1,H1,1,H3,W1,1,W3,0,H11,0,H31,W11,0,W31],[0,H1,0,H3,W1,0,W3,1,H11,1,H31,W11,1,W31]).
l_r_hw([1,H1,H2,1,W1,W2,1,0,H11,H21,0,W11,W21,0],[0,H1,H2,0,W1,W2,0,1,H11,H21,1,W11,W21,1]).

% transport left -> right 
trans_l_r(X,Y):-l_r_h(X,Y).
trans_l_r(X,Y):-l_r_hh(X,Y).
trans_l_r(X,Y):-l_r_w(X,Y).
trans_l_r(X,Y):-l_r_ww(X,Y).
trans_l_r(X,Y):-l_r_hw(X,Y).

% transition state
% transport left -> right if boat is left else { right -> left is inverse of case left -> right}
transport(X,Y):-X=[1,_,_,_,_,_,_,0,_,_,_,_,_,_],trans_l_r(X,Y);X=[0,_,_,_,_,_,_,1,_,_,_,_,_,_],trans_l_r(Y,X).

% dangerous cases
dangerous([_,0,1,_,1,_,_,_,_,_,_,_,_,_]).
dangerous([_,0,_,1,1,_,_,_,_,_,_,_,_,_]).
dangerous([_,0,1,1,1,_,_,_,_,_,_,_,_,_]).
dangerous([_,1,0,_,_,1,_,_,_,_,_,_,_,_]).
dangerous([_,_,0,1,_,1,_,_,_,_,_,_,_,_]).
dangerous([_,1,0,1,_,1,_,_,_,_,_,_,_,_]).
dangerous([_,1,_,0,_,_,1,_,_,_,_,_,_,_]).
dangerous([_,_,1,0,_,_,1,_,_,_,_,_,_,_]).
dangerous([_,1,1,0,_,_,1,_,_,_,_,_,_,_]).
dangerous([_,_,_,_,_,_,_,_,0,1,_,1,_,_]).
dangerous([_,_,_,_,_,_,_,_,0,_,1,1,_,_]).
dangerous([_,_,_,_,_,_,_,_,0,1,1,1,_,_]).
dangerous([_,_,_,_,_,_,_,_,1,0,_,_,1,_]).
dangerous([_,_,_,_,_,_,_,_,_,0,1,_,1,_]).
dangerous([_,_,_,_,_,_,_,_,1,0,1,_,1,_]).
dangerous([_,_,_,_,_,_,_,_,_,1,0,_,_,1]).
dangerous([_,_,_,_,_,_,_,_,1,_,0,_,_,1]).
dangerous([_,_,_,_,_,_,_,_,1,1,0,_,_,1]).

% husband dfs
husband(X,P,[X|P]):-goal(X),!.
husband(X,P,L):-transport(X,Y),X\=Y,\+dangerous(Y),\+member(Y,P),husband(Y,[X|P],L).
