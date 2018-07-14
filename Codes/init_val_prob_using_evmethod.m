function [sols,vals]= linear_de_ivp_solver(A,B,C)
        syms t lambda
        n=length(A);
        [v,D]=eig(A);
        eignvalues=diag(D);
        consts=reshape(sym('c%d',1:n),n,1);
        unique_eignvalues=unique(eignvalues);
        mults=hist(eignvalues,unique_eignvalues);
        sols=sym('x%d',[1 n]);
        if length(unique_eignvalues)~=length(eignvalues)
            i=1;
            ch_mat=A-lambda*eye(n);
            v=vpa(v);
            while i<=n
                [pos]=find(unique_eignvalues == eignvalues(i));
                if mults(pos)>1
                    e_vector=V(:,i);
                    a_mat=subs(ch_mat,eignvalues(i));
                    for j=1:mults(pos)
                        v(:,i)=V(:,i).*(t^(j-1));
                        P=inv(a_mat^(j-1)+e_vector);
                        v(:,i) = v(:, i)+p;
                        i=i+1;
                    end;
                else
                    i=i+1;
                end;
            end;
        end;
        for i=1:n
        sols(i) = (v(i, :).*exp(eignvalues'*t)) *consts;
        end;
        vals= solve(subs(sols, t, B) ==C);
        constnames = fieldnames(vals);
        for i=1:n
            sols = subs(sols, consts(i),vals.(constnames{i}));
        end;
