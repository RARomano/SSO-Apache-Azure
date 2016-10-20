# SSO-Apache-Azure
Exemplo de SSO utilizando Open ID e Azure AD

Esse exemplo utiliza o **Apache** como servidor Web e o módulo **mod_auth_openidc** https://github.com/pingidentity/mod_auth_openidc.

## Configurações adicionais
Abra o arquivo apache2.config e substitua os tokens **{TenantId}**, **{{RedirectUrl}}**, **{ClientId}** e **{ClientSecret}** por valores reais do seu ambiente.

`
OIDCProviderIssuer https://sts.windows.net/{TenantId}
OIDCProviderTokenEndpoint https://login.microsoftonline.com/{TenantId}/oauth2/token
OIDCProviderTokenEndpointAuth client_secret_post
OIDCClientID {ClientId}
OIDCClientSecret {ClientSecret}
OIDCProviderAuthorizationEndpoint https://login.microsoftonline.com/{TenantId}/oauth2/authorize
OIDCProviderJwksUri https://login.windows.net/common/discovery/keys
OIDCRedirectURI {{RedirectUrl}}
OIDCResponseType id_token
OIDCResponseMode form_post

OIDCProviderUserInfoEndpoint https://login.microsoftonline.com/{TenantId}/openid/userinfo
OIDCCryptoPassphrase {ClientSecret}
`

Para gerar o **ClientID**, **ClientSecret** e **RedirectUrl**, siga os passos abaixo:

1. Abra o [portal de gerenciamento do Azure](https://manage.windowsazure.com/) e clique em Active Directory.
1. Escolha o domínio
![Domínio](https://cloud.githubusercontent.com/assets/12012898/9564863/dad31a90-4e8a-11e5-8708-24bc945ae095.png)
1. No menu superior, escolha **Aplicativos** e depois clique em **Adicionar**.
![Aplicativos](https://cloud.githubusercontent.com/assets/12012898/9564869/45595046-4e8b-11e5-9a83-84a34806ca5a.png)
1. Clique em **Adicionar uma aplicação que minha empresa esteja desenvolvendo**
![Aplicativo](https://cloud.githubusercontent.com/assets/12012898/9564874/8c06200a-4e8b-11e5-8cb2-f134fcf9dbfa.png)
1. Dê um nome para o seu aplicativo e escolha a opção Web API
![Nome](https://cloud.githubusercontent.com/assets/12012898/9564881/e8c1b08e-4e8b-11e5-80b6-cd0b0b179bad.png)
1. Digite uma URL para logon da aplicação (coloque a URL criada na primeita etapa) e uma URL que identificará a sua aplicação posteriormente (também poderá ser alterado depois).
![Identificação](https://cloud.githubusercontent.com/assets/12012898/9564880/e895684e-4e8b-11e5-9d4a-5de5bf65dd10.png)
1. Clique em configurar
![Configurar]("https://cloud.githubusercontent.com/assets/12012898/9565185/33786270-4e97-11e5-9f31-3c98f166f220.png)
1. Clique em URL de resposta e adicione a url da sua aplicação no Apache, Por exemplo, http://localhost. Em chaves, escolha 1 ano e em permissões, clique em **Adicionar Aplicativo** e escolha Office 365 SharePoint Online. Delegue as permissões necessárias para a sua aplicação e clique em salvar. Anote os valores de Client ID e Client Secret gerados.
![Configurações adicionais](https://cloud.githubusercontent.com/assets/12012898/9565194/56936778-4e97-11e5-8504-2aaa3e921fea.png)
1. Clique em Exibir pontos de entrada e copie a primeira URL. Nessa URL você verá o ID do tenant, no formato GUID.
![Pontos de Entrada](https://cloud.githubusercontent.com/assets/12012898/9565207/bdc359b2-4e97-11e5-8a48-78ade248fa84.png)
1. Após salvar o Client Secret aparecerá para você utilizar na aplicação

## Rodando a aplicação

- `docker build . -t apache`
- `docker run -p 80:80 -it apache`

- Abra um novo browser privado e abra o endereço: http://localhost/index.shtml