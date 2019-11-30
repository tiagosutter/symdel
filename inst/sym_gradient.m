function grad = sym_gradient(U, vars, coordSys)
    %SYM_GRADIENT Gradiente simbolico
    %   Calcula o gradiente simbolico de um campo vetorial V, em função
    %   das variáveis especificadas no vetor vars.
    %
    %   Sintaxe: sym_gradient(U, vars, coordSys)
    %
    %   Entradas:
    %     U - Campo escalar
    %     vars - vetor com 3 dimensões com as variáveis utlizadas
    %     coordSys - sistema de coordenada:
    %       'cartesian' para coordenadas cartesianas
    %       'cylindrical' para coordenadas cilíndricas
    %       'spherical' para coordenadas esféricas

    %   TODO: Colocar exemplos
    
    if length(vars) < 3 && ~isvector(vars)
        E = MException('sym_divergence:InvalidInput',...
                       'vars deveria ser um vetor tridimensional.');
        throw(E);
    end
    
    switch lower(coordSys)
        case 'cartesian'
            x = vars(1);
            y = vars(2);
            z = vars(3);

            grad = [diff(U, x); diff(U, y); diff(U, z)];
        case 'cylindrical'
            rho = vars(1);
            phi = vars(2);
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
                ];
        otherwise
            E = MException('sym_gradient:InvalidCoordSys', 'The specified coordinates system is not valid.');
            throw(E);
    end
end

