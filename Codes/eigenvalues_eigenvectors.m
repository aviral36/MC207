%%linear_DE_solver:Solve a system of linear Homogenous DEs
function[sols]=linear_DE_system_solver(A)
syms t
syms lambda
n=length(A);
[V,D]=eig(A);
eignvalues=diag(D);
consts=reshape(sym('c%d',1:n),n,1);
unique_eignvalues=unique(eignvalues);
        mults=histc(eignvalues,unique_eignvalues);
        sols=sym('x%d',[1 n]);
        if length(unique_eignvalues)~=length(eignvalues)
            i=1;
            ch_mat=A-lambda*eye(n);
            V=vpa(V);
            while i<=n
                [pos]=find(unique_eignvalues == eignvalues(i));
                if mults(pos)>1
                    e_vector=V(:,i);
                    a_mat=subs(ch_mat,eignvalues(i));
                    for j=1:mults(pos)
                        V(:,i)=V(:,i).*(t^(j-1));
                        P=inv(a_mat^(j-1)+e_vector);
                        V(:,i) = V(:, i)+p;
                        i=i+1;
                    end;
                else
                    i=i+1;
                end;
            end;
        end;
        for i=1:n
        sols(i) = (V(i, :).*exp(eignvalues'*t)) *consts;
        end;
