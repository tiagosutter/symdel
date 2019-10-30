function grad = sym_gradient(U, vars, coordSys)
    %SYM_DIVERGENCE Gradiente simbolico
    %   TODO: Explicação detalhada
    %   TODO: Colocar exemplos
    
    switch lower(string(coordSys))
        case 'cartesian'
            grad = gradient(U, vars);
        case 'cylindrical'
            rho = vars(1);
            phi= vars(2);
            z  = vars(3);

            grad = [diff(U, rho),...
                    (1/rho)*diff(U, phi),...
                    diff(U, z)];
        case 'spherical'
            r = vars(1);
            theta = vars(2);
            phi = vars(3);
            % TODO: Implementar gradiente em coord. esféricas
            E = MException('sym_gradient:NotImplemented', 'Gradient in spherical coordinates not implemented yet');
            throw(E);
        otherwise
            E = MException('sym_gradient:InvalidCoordSys', 'The specified coordinates system is not valid.');
            throw(E);
    end
end

