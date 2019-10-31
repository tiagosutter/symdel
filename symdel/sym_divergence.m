function div = sym_divergence(V, vars, coordSys)
    %SYM_DIVERGENCE Divergente simbolico de um campo vetorial
    %   Calcula o divergente simbolico de um campo vetorial V, em função
    %   das variáveis especificadas no vetor vars.
    
    %   TODO: Colocar exemplos
    
    if length(V) < 3
        E = MException('sym_divergence:InvalidInput',...
                       'A entrada deveria ser um vetor tridimensional.');
        throw(E);
    end
    
    switch lower(string(coordSys))
        case 'cartesian'
            div = divergence(V, vars);
        case 'cylindrical'
            [rho, Vrho] = deal(vars(1), V(1));
            [phi, Vphi] = deal(vars(2), V(2));
            [z, Vz] = deal(vars(3), V(3));

            div = (1/rho)*diff(rho*Vrho, rho) ...
                + (1/phi)*diff(Vphi, phi) ...
                + diff(Vz, z);
        case 'spherical'
            [r, Vr] = deal(vars(1), V(1));
            [theta, Vtheta] = deal(vars(2), V(2));
            [phi, Vphi] = deal(vars(3), V(3));

            div = (1/(r^2)) * diff( (r^2)*Vr, r )  ...
                + (1/(r*sin(theta))) * diff( sin(theta)*Vtheta, theta ) ...
                + (1/(r*sin(theta))) * diff( Vphi, phi );
        otherwise
            E = MException('sym_divergence:InvalidCoordSys', 'Invalid coordinate system.');
            throw(E);
    end
end

