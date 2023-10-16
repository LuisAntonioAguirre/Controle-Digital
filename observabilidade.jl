
#=
  Cálculos matriciais referentes ao vídeo:
  https://youtu.be/jk3sr7_R-Xs

Luis A Aguirre 14/01/18
http://www.researcherid.com/rid/A-2737-2008
=#

# matriz A, vetores b e c
A=[-0.2 0;-1 0.8]
b=[1;1]
cT=[-1 1]

# matriz de observabilidade
O=[cT;cT*A]
rank(O)
# a matriz tem poso 1, portanto o par (A,cT) é não observável

# autovalores em L e autovetores em M
(L,M)=eig(A)

# matrizes nas coordenadas x_tilde=inv(M)*x
A_tilde=inv(M)*A*M
b_tilde=inv(M)*b
cT_tilde=cT*M
