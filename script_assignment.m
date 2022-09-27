% Benedetti Lorenzo
% 4679798

% Assignment of the course "Control of Linear Multivariable Systems".

A = [5, 0;
     2, 3];

C = [0 1];

V = [10, 0;
     0, 10];

B = [1, 0;
     0, 2];

P = [1, 0;
     0, 2];

% K is the optimal gain matrix.
% S is the solution of the Riccati's equation.
% e are the closed-loop eigenvalues of A-B*L where L = P^-1(B'S).

[L, K, e] = lqr(A, B, V, P, 0);

% Check observability.
% H is such that V = H'H we need it to check the observability.
% We calculate Q to assign the eigenvalues of F.

H = chol(V);

Q = [C;
     C*A];

rank(Q);

% We assign -20, -20 as eigenvalues.

% Calculate the transfer function giving the state equation

A_ = A - B * L;

B_ = B * [1;0];

[b,a] = ss2tf(A_, B_, C, 0);

% Frequency response analysis

Si = tf(b,a);

bode(Si)
grid on

[mag, phase] = bode(Si);

