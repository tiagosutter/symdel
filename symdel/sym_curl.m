function c = sym_curl(V, vars, coordSys)
    %SYM_CURL Rotacional simbolico de um campo vetorial
    %   Calcula o rotacional simbolico de um campo vetorial V, em função
    %   das variáveis especificadas no vetor vars.
    %
    %   Entradas:
    %     U - Campo vetorial
    %     vars - vetor com 3 dimensões com as variáveis utlizadas
    %     coordSys - sistema de coordenada:
    %       'cartesian' para coordenadas cartesianas
    %       'cylindrical' para coordenadas cilíndricas
    %       'spherical' para coordenadas esféricas

    %   TODO: Colocar exemplos

    if length(V) < 3 && ~isvector(V)
        E = MException('sym_curl:InvalidInput',...
            'A entrada deveria ser um vetor de três dimensões.');
        throw(E);
    end
    
    if length(vars) < 3 && ~isvector(vars)
        E = MException('sym_divergence:InvalidInput',...
                       'vars deveria ser um vetor tridimensional.');
        throw(E);
    end

    switch lower(string(coordSys))
        case 'cartesian'
            c = sym_curl_cartesian(V, vars);
        case 'cylindrical'
            c = sym_curl_cylindrical(V, vars);
        case 'spherical'
            c = sym_curl_spherical(V, vars);
        otherwise
            E = MException('sym_curl:InvalidCoordSys',...
                'Invalid coordinate system.');
            throw(E);
    end
end


function c = sym_curl_cartesian(V, vars)
    [Vx, x] = deal(V(1), vars(1));
    [Vy, y] = deal(V(2), vars(2));
    [Vz, z] = deal(V(3), vars(3));

    c = [diff(Vz, y) - diff(Vy, z); ...
        diff(Vx, z) - diff(Vz, x); ...
        diff(Vy, x) - diff(Vx, y)];
end


function c = sym_curl_cylindrical(V, vars)
    [rho, Vrho] = deal(vars(1), V(1));
    [phi, Vphi] = deal(vars(2), V(2));
    [z, Vz] = deal(vars(3), V(3));

    c = [diff(Vz, phi)/rho - diff(Vphi, z); ...
        diff(Vrho, z) - diff(Vz, rho); ...
        (diff(rho*Vphi, rho) - diff(Vrho, phi))/rho];
end


function c = sym_curl_spherical(V, vars)
    [r, Vr] = deal(vars(1), V(1));
    [theta, Vtheta] = deal(vars(2), V(2));
    [phi, Vphi] = deal(vars(3), V(3));

    c = [(diff(Vphi*sin(theta), theta) - diff(Vtheta, phi))/(r*sin(theta)); ...
        (diff(Vr, phi)/sin(theta) - diff(r*Vphi, r))/r; ...
        (diff(r*Vtheta, r) - diff(Vr, theta))/r];
end