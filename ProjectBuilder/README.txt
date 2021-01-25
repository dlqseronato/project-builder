## BUILDER CRIADO POR: DIEGO SERONATO ##
OBJETIVO: Geração do EAR para entrega de todas as telas compiladas para o cliente

ATENÇÃO: Para rodar este .bat é necessário efetuar as configurações abaixo:
	Abrir o arquivo ProjectBuilder\config\config.properties com o programa NOTEPAD++
	O Script não pode estar em um caminho com Espaços, exemplo de caminho funcional:
		C:\diego.seronato\PROJETOS_SVN_NOVO\MIGRACAO_VERSAO\ScriptsAuxiliares\ProjectBuilder

1) No Menu do NOTEPAD++ alterar a codificação do arquivo para UTF-8 no caminho da barra de tarefas abaixo:
	Formatar > Codificação em UTF-8

2) Após isso, Configurar as seguintes variáveis abaixo:

	a) Caminho para o compilador ANT (Fica dentro da sua pasta de instalação do NetBeans) 
	Exemplo:
		ANT_PATH="C:\Program Files\NetBeans 8.2 RC\extide\ant\bin"
	
	b) Caminho para o servidor wildfly
	Exemplo:
		SERVER="C:\diego.seronato\UTILIDADES\wildfly13"
		
	c) Caminho para o projeto angular, deve apontar para a pasta conppwPadrao-UI
	Exemplo: 
		UI_CAMINHO="C:\diego.seronato\PROJETOS_SVN_NOVO\MIGRACAO_VERSAO\3 - Construção\PacotesCustomizados\CETELEM\conppwPadrao-UI"
		
	d) Caminho para o projeto java, deve apontar para a pasta conppwpadrao-jv
	Exemplo: 		
		JV_CAMINHO="C:\diego.seronato\PROJETOS_SVN_NOVO\MIGRACAO_VERSAO\3 - Construção\PacotesCustomizados\CETELEM\conppwpadrao-jv"

	e) Caso queira compilar somente uma tela, definir a variável COMPILAR_TELA com a tela desejada, do contrário comentar a linha com essa configuração usando dois pontos duas vezes ::
 		
		Para compilar a tela ofertaacordofila
			Exemplo:
				COMPILAR_TELA=ofertaacordofila
		Para compilar todas as telas, basta adicionar "::" no começo da variavel de tela. 
			Exemplo:
				::COMPILAR_TELA=ofertaacordofila

3) Após essas configuracoes, para rodar há duas alternativas, caso queira:
	a) Gerar o pacote EAR e assets na pasta \entrega, executar o arquivo ProjectBuilder.bat
	b) Com o netbeans com o console rodando, efetuar o deploy rápido diretamente no servidor executando o arquivo TelaBuildOnTheFly.bat para ver alterações imediatas na tela.
		




