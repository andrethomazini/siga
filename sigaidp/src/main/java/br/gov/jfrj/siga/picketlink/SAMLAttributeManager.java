package br.gov.jfrj.siga.picketlink;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.jacc.PolicyContext;
import javax.servlet.http.HttpServletRequest;

import org.picketlink.identity.federation.core.interfaces.AttributeManager;

/**
 * @author Rodrigo Ramalho
 * 	       hodrigohamalho@gmail.com
 * 
 * Esse handler � chamado assim que um usu�rio se autentica. � uma maneira de passar
 * par�metros para os SPs. Nesse caso ser� passado o sessionID do IDP para manipula��o
 * de requests entre os SPs.
 */
public class SAMLAttributeManager implements AttributeManager {
	
	private final String ATTRIBUTE = "IDPsessionID";
	private final String REQUEST = "javax.servlet.http.HttpServletRequest";

	/**
	 * Tudo que for colocado neste mapa que � retornado ser� colocado na sess�o e pode ser
	 * recuperado atrav�s do m�todo session.getAttribute("SESSION_ATTRIBUTE_MAP")
	 */
	@Override
	public Map<String, Object> getAttributes(Principal userPrincipal, List<String> attributeKeys) {
    	Map<String, Object> sessionAttrs = new HashMap<String, Object>();
    	
	    try{
	    	HttpServletRequest request = (HttpServletRequest) PolicyContext.getContext(REQUEST);
	    	sessionAttrs.put(ATTRIBUTE, request.getSession().getId());
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
		
		return sessionAttrs;
	}

}
