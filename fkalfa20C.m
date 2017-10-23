function [alfa, kappa]=fkalfa20C(freq,taur,Elev)
%
% function [alfa, kappa]=fkalfa20C(freq,taur,Elev)
%
% The function FKALFA20C calculates the alpha and kappa coefficient
% according to Maggiori at the temperature of 20?C.
%
% Input
% freq: frequency [GHz]
% taur: polarization angle [rad]
% Elev: elevation [rad]
%
% Output
% [alfa, kappa]: alpha and kappa coefficient
%
% Ref.: Dario Maggiori, "Computed transmission through rain in the 1-400
%       GHz frequency range for spherical and elliptical drops and any
%       polarization", Alta Frequenza, Vol. L, No. 5, Sept.-Oct. 1981
%
% By: C. Riva, E. Matricciani
% Release: 15/12/03

DatiKappaH=[.00003867 .0001539 .0006499 .001745 .004536 .01010 .01882 .03668 .07508 .1244 .1871 .2629 .3495 .4424 .5362 .6253 .7069 .7816 .8514 .9167 .9753 1.025 1.064 1.094 1.116 1.177 1.310 1.448 1.364 1.318];
DatiKappaV=[.00003516 .0001384 .0005910 .001547 .003946 .008870 .01681 .03347 .06906 .1130 .1674 .2334 .3098 .3932 .4793 .5632 .6419 .7149 .7836 .8477 .9063 .9572 .9992 1.033 1.059 1.132 1.267 1.420 1.349 1.309];

DatiAlfaH=[.9116 .9632 1.121 1.307 1.327 1.276 1.217 1.154 1.099 1.061 1.020 .9789 .9391 .9032 .8725 .8471 .8261 .8083 .7930 .7798 .7687 .7598 .7529 .7476 .7434 .7313 .7095 .6887 .6876 .6827];
DatiAlfaV=[.8802 .9234 1.075 1.265 1.310 1.264 1.200 1.128 1.065 1.030 .9997 .9633 .9287 .8965 .8683 .8443 .8243 .8073 .7925 .7799 .7693 .7606 .7537 .7483 .7441 .7320 .7112 .6899 .6890 .6841];

CampoFreq=[1 2 4 6 8 10 12 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100 120 150 200 300 400];

if (freq<min(CampoFreq))||(freq>max(CampoFreq))
  kappa=0;
  alfa=0;
else
  I=find(CampoFreq>=freq);
  index=I(1);
  if CampoFreq(index)==freq
    %the interpolation is not necessary
    AlfatempV=DatiAlfaV(index);
    AlfatempH=DatiAlfaH(index);
    KappatempV=DatiKappaV(index);
    KappatempH=DatiKappaH(index);
  else
    %a logarithmic interpolation is carried out
    fris=(log10(freq)-log10(CampoFreq(index-1)))/(log10(CampoFreq(index))-log10(CampoFreq(index-1)));
    KappatempH=10^((log10(DatiKappaH(index))-log10(DatiKappaH(index-1)))*fris+log10(DatiKappaH(index-1)));
    KappatempV=10^((log10(DatiKappaV(index))-log10(DatiKappaV(index-1)))*fris+log10(DatiKappaV(index-1)));
    AlfatempH=(DatiAlfaH(index)-DatiAlfaH(index-1))*fris+DatiAlfaH(index-1);
    AlfatempV=(DatiAlfaV(index)-DatiAlfaV(index-1))*fris+DatiAlfaV(index-1);
  end
  kappa=(KappatempH+KappatempV+(KappatempH-KappatempV)*cos(Elev)*cos(Elev)*cos(2*taur))/2;
  alfa=(KappatempH*AlfatempH+KappatempV*AlfatempV+(KappatempH*AlfatempH-KappatempV*AlfatempV)*cos(Elev)*cos(Elev)*cos(2*taur))/(2*kappa);
end

return