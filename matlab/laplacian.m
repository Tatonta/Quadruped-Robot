function L = laplacian(phi)
Rb = zeros(2,2,size(phi,2),size(phi,2));
for j=1:size(phi,2)
 for k=1:size(phi,2)
 if j~=k 
 t= -rotz(phi(j)-phi(k));
 Rb(:,:,j,k) = t(1:2,1:2);
 end
 end
end
L=[ 3*eye(2) Rb(:,:,1,2) Rb(:,:,1,3) Rb(:,:,1,4);
 Rb(:,:,2,1) 3*eye(2) Rb(:,:,2,3) Rb(:,:,2,4);
 Rb(:,:,3,1) Rb(:,:,3,2) 3*eye(2) Rb(:,:,3,4);
 Rb(:,:,4,1) Rb(:,:,4,2) Rb(:,:,4,3) 3*eye(2)];

