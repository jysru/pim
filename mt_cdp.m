function [ mt, diffrac ] = mt_cdp( reseau, filtre )
    %% Matrice de couplage diffractif
    [ diffrac ] = mc_diffrac( reseau, filtre ) ;
    
    %% Matrice 
    switch lower(reseau.maille)
        case 'lineaire'
            switch lower(filtre.plot)
                case 'fente'
                    % Maille lineaire, plot fente
                    mt = filtre.beta*eye(reseau.n) + (exp(1i*filtre.dphi)-filtre.beta)*(sqrt(pi)*filtre.gamma*reseau.eta/reseau.n)*diffrac ;
                case 'disque'
                    % Maille lin�aire, plot disque (v�rifier le calcul)
                    mt = filtre.beta*eye(reseau.n) + (exp(1i*filtre.dphi)-filtre.beta)*sqrt(2)*pi*(0.61*filtre.gamma*reseau.eta/reseau.n)*diffrac ;
                otherwise
                    error('Couple (Type de r�seau ; Plot du filtre) non existant ou non impl�ment�')
            end
            
        case 'carree'
            switch lower(filtre.plot)
                case 'carre'
                    % Maille carr�e, plot carr�
                    mt = filtre.beta*eye(reseau.n) + (exp(1i*filtre.dphi)-filtre.beta)*(sqrt(pi)*filtre.gamma*reseau.eta/reseau.nd)^2*diffrac ;
                case 'disque'
                    % Maille carr�e, plot disque
                    mt = filtre.beta*eye(reseau.n) + (exp(1i*filtre.dphi)-filtre.beta)*2*pi^2*(0.61*filtre.gamma*reseau.eta/reseau.nd)^2*diffrac ;
                otherwise
                    error('Couple (Type de r�seau ; Plot du filtre) non existant ou non impl�ment�')
            end
            
        case 'hexagonale'
            switch lower(filtre.plot)
                case 'carre'
                    % Maille hexa, plot carr�
                    mt = filtre.beta*eye(reseau.n) + (exp(1i*filtre.dphi)-filtre.beta)*(sqrt(pi)*filtre.gamma*reseau.eta/reseau.nd)^2*diffrac ;
                case 'disque'
                    % Maille hexa, plot disque
                    mt = filtre.beta*eye(reseau.n) + (exp(1i*filtre.dphi)-filtre.beta)*2*pi^2*(0.61*filtre.gamma*reseau.eta/reseau.nd)^2*diffrac ;
                otherwise
                    error('Couple (Type de r�seau ; Plot du filtre) non existant ou non impl�ment�')
            end
            
        otherwise
            error('Type de r�seau non existant ou non impl�ment�')
    end

    % Normalisation
    mt = mt/max(max(abs(mt))) ;
    
end

