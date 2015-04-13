<%@ include file="/WEB-INF/page/include.jsp"%>

<li><a href="#">Procedimentos</a>
	<ul>
		<ww:url id="url" action="resumo" namespace="/">
		</ww:url>
		<li><ww:a href="%{url}">Ativos</ww:a>
		</li>

		<c:if
			test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA;WF;OPERAR:Executar comandos da tela inicial')}">
			<li><a href="#">Iniciar</a>
				<ul class="navmenu-large">
					<c:forEach var="pd" items="${processDefinitions}">
						<ww:url id="url" action="initializeProcess" namespace="/">
							<ww:param name="orgao">${lotaTitular.orgaoUsuario.acronimoOrgaoUsu}</ww:param>
							<ww:param name="procedimento">${pd.name}</ww:param>
							<ww:param name="pdId">${pd.id}</ww:param>
							<ww:param name="secaoUsuario">${lotaTitular.orgaoUsuario.descricaoMaiusculas}</ww:param>
						</ww:url>
						<li><ww:a href="%{url}">${pd.name}</ww:a>
						</li>
					</c:forEach>
				</ul></li>
		</c:if>
	</ul> <c:if
		test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA;WF;FE:Ferramentas')}">
		<li><a href="#">Ferramentas</a>
			<ul>
				<c:if
					test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA;WF;CONFIGURAR:Configurar iniciadores')}">
					<li><a href="#">Configurar</a>
						<ul class="navmenu-large">
							<c:forEach var="pd" items="${processDefinitions}">
								<ww:url id="url" action="configurar" namespace="/">
									<ww:param name="orgao">${lotaTitular.orgaoUsuario.acronimoOrgaoUsu}</ww:param>
									<ww:param name="procedimento">${pd.name}</ww:param>
									<ww:param name="pdId">${pd.id}</ww:param>
									<ww:param name="secaoUsuario">${lotaTitular.orgaoUsuario.descricaoMaiusculas}</ww:param>
								</ww:url>
								<li><ww:a href="%{url}">${pd.name}</ww:a>
								</li>
							</c:forEach>
						</ul></li>
				</c:if>

				<c:if
					test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA;WF;DESIGNAR:Designar tarefas')}">
					<li><a href="#">Designar Tarefas</a>
						<ul class="navmenu-large">
							<c:forEach var="pd" items="${processDefinitions}">
								<ww:url id="url" action="pesquisarDesignacao" namespace="/">
									<ww:param name="orgao">${lotaTitular.orgaoUsuario.acronimoOrgaoUsu}</ww:param>
									<ww:param name="procedimento">${pd.name}</ww:param>
									<ww:param name="pdId">${pd.id}</ww:param>
									<ww:param name="secaoUsuario">${lotaTitular.orgaoUsuario.descricaoMaiusculas}</ww:param>
								</ww:url>
								<li><ww:a href="%{url}">${pd.name}</ww:a>
								</li>
							</c:forEach>
						</ul></li>
				</c:if>
			</ul>
		</li>
	</c:if>
</li>
<c:if
	test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA;WF;MEDIR: Analisar m�tricas')}">

	<li><a href="#">Relat�rios</a>
		<ul>
			<li><a href="#">Apresentar M�tricas</a>
				<ul class="navmenu-large">
					<c:forEach var="pd" items="${processDefinitions}">
						<ww:url id="url" action="medir" namespace="/">
							<ww:param name="orgao">${lotaTitular.orgaoUsuario.idOrgaoUsu}</ww:param>
							<ww:param name="procedimento">${pd.name}</ww:param>
							<ww:param name="pdId">${pd.id}</ww:param>
						</ww:url>
						<li><ww:a href="%{url}">${pd.name}</ww:a>
						</li>
					</c:forEach>
				</ul></li>
		</ul>
	</li>
	</li>
</c:if>