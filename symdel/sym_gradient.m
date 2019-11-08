function grad = sym_gradient(U, vars, coordSys)
    %SYM_GRADIENT Gradiente simbolico
    %   Calcula o gradiente simbolico de um campo vetorial V, em função
    %   das variáveis especificadas no vetor vars.
    
    %   TODO: Colocar exemplos
    
    switch lower(string(coordSys))
        case 'cartesian'
            grad = gradient(U, vars);
        case 'cylindrical'
            rho = vars(1);
            phi= vars(2);
            z  = vars(3);

            grad = [diff(U, rho);...
                    (1/rho)*diff(U, phi);...
                    diff(U, z)];
        case 'spherical'
            r = vars(1);
            theta = vars(2);
            phi = vars(3);
            
            grad = [diff(U, r); ...
                    diff(U, theta)/r; ...
                    diff(U, phi)/(r*sin(theta))
                ]
        otherwise
            E = MException('sym_gradient:InvalidCoordSys', 'The specified coordinates system is not valid.');
            throw(E);
    end
end

