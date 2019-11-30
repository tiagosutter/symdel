# sym∇
Funções MATLAB para calculo simbólico de divergente, gradiente e rotacional nos sistemas de coordenadas: 
* cartesianas (x, y, z)
* cilíndricas círculares (ρ, ϕ, z)
* esféricas (r, θ, ϕ)

## Motivação

O projeto foi motivado pela necessidade de realizar calculos simbolicos em coordenadas cilíndricas e esféricas, para resolução computacional de problemas propostos na disciplina de Eletromagnetismo na [UCP](http://ucp.br/).

## Instalação MATLAB

Basta fazer o [download do arquivo symdel.mltbx](https://github.com/tiagosutter/symdel/releases/download/v1.2.0/symdel.mltbx) e então arrastar e soltar o arquivo na linha de comandos do MATLAB.

## Instalação Octave
Na linha de comando do Octave executar:

`pkg install https://github.com/tiagosutter/symdel/archive/v1.2.0.tar.gz`

Lembrando que no Octave é necessário carregaro os pacotes que serão utilizado, para carregar a biblioteca use

`pkg load symdel`

Para mais informações sobre a instalação e o instalador visite: [Como fazer a instalação](https://github.com/tiagosutter/symdel/wiki/Instala%C3%A7%C3%A3o-como-toolbox)

## Como usar
Saiba mais sobre como usar na [documentação](https://github.com/tiagosutter/symdel/wiki)

Para obter documentação offline no MATLAB execute:
```
doc symdel
```

## Veja em ação:
.gif com execução da função sym_gradient

![sym_gradient](img/sym_grad.gif)

O código do .gif acima foi executado no Live editor do MATLAB.
