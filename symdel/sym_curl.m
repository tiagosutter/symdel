function c = sym_curl(V, vars, coordSys)
    %SYM_CURL Rotacional simbolico de um campo vetorial
    %   Calcula o rotacional simbolico de um campo vetorial V, em função
    %   das variáveis especificadas no vetor vars.

    %   TODO: Colocar exemplos

    if length(V) < 3
        E = MException('sym_curl:InvalidInput',...
            'A entrada deveria ser um vetor tridimensional.');
        throw(E);
    end

    switch lower(string(coordSys))
        case 'cartesian'
            c = curl(V, vars);
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


function c = sym_curl_cylindrical(V, vars)
    [rho, Vrho] = deal(vars(1), V(1));
    [phi, Vphi] = deal(vars(2), V(2));
    [z, Vz] = deal(vars(3), V(3));

    c = [diff(Vz, phi)/rho - diff(Vphi, z), ...
        diff(Vrho, z) - diff(Vz, rho), ...
        (diff(rho*Vphi, rho) - diff(Vrho, phi))/rho];
end


function c = sym_curl_spherical(V, vars)
    [r, Vr] = deal(vars(1), V(1));
    [theta, Vtheta] = deal(vars(2), V(2));
    [phi, Vphi] = deal(vars(3), V(3));

    c = [(diff(Vphi*sin(theta), theta) - diff(Vtheta, phi))/(r*sin(theta)), ...
        (diff(Vr, phi)/sin(theta) - diff(r*Vphi, r))/r, ...
        (diff(r*Vtheta, r) - diff(Vr, theta))/r];
end