package com.example.javawebtutor.action;
import com.microsoft.azure.AzureEnvironment;
import com.microsoft.azure.management.Azure;
import com.example.azure.keyvault.*;
import com.microsoft.azure.management.keyvault.Vault;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.microsoft.applicationinsights.core.dependencies.http.client.HttpClient;
import com.microsoft.applicationinsights.core.dependencies.http.impl.client.HttpClients;
import com.microsoft.azure.AzureResponseBuilder;
import com.microsoft.azure.credentials.AppServiceMSICredentials;
import com.microsoft.azure.credentials.AzureTokenCredentials;
import com.microsoft.azure.keyvault.*;
import com.microsoft.azure.keyvault.models.SecretBundle;
import com.microsoft.azure.serializer.AzureJacksonAdapter;
import com.microsoft.rest.RestClient;
import com.microsoft.rest.credentials.ServiceClientCredentials;
import com.example.javawebtutor.form.LoginForm;

public class LoginAction extends Action {
	private static final Logger logger = Logger.getLogger(LoginAction.class);
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		LoginForm loginForm = (LoginForm) form;
		
		//AzureTokenCredentials accessToken = new AzureTokenCredentials.;
		/*
		RestClient restClient = new RestClient.Builder()
	            .withBaseUrl("https://testkeyvalut2019.vault.azure.net")
	            .withCredentials(new ServiceClientCredentials())
	            .withSerializerAdapter(new AzureJacksonAdapter())
	            .withResponseBuilderFactory(new AzureResponseBuilder.Factory())
	            .build();
		KeyVaultClient kvc = new KeyVaultClient(restClient);*/
		/*SecretBundle secret = kvc.getSecret("https://testkeyvalut2019.vault.azure.net", "testpgdbadminsecret", "748b1bff230549d1b4e3086c4eb03df0"); */
		/*String secret = kvc.getSecret("https://testkeyvalut2019.vault.azure.net:443/secrets/testpgdbadminsecret").value();
	    */
		// ClientSecretKeyVaultCredential is the implementation of KeyVaultCredentials
		KeyVaultClient client = new KeyVaultClient(
		        new ClientSecretKeyVaultCredential("091456de-97c1-40d2-afed-6153e62e9d4e", "rP3moDYThlrs5lxH86kGFqbmailT.---"));

		// KEYVAULT_URL is the location of the keyvault to use: https://yourkeyvault.vault.azure.net
		// "testSecret" is the name of the secret in the key vault
		SecretBundle secret = client.getSecret( "https://testkeyvalut2019.vault.azure.net", "secret2" );
		logger.info("----");
		logger.info(secret.value() );
		//logger.info("***Login at line1***");
	    //Azure azure = Azure.authenticate(new AppServiceMSICredentials(AzureEnvironment.AZURE));
        //.withSubscription("f3167a54-29be-4523-8189-0bc590352d2c");
		//logger.info("***Login at line2***");
	    //	Vault myKeyVault = azure.vaults().getByResourceGroup("FirstResourceGroup", "TestKeyValut2019");
	    //	logger.info("***Login at line3***");
		//logger.info(myKeyVault.secrets().getById("testpgdbadminsecret"));
		
		//AppServiceMSICredentials credentials = new AppServiceMSICredentials(AzureEnvironment.AZURE, System.getenv("MSI_ENDOINT"), System.getenv("MSI_SECRET"));
		//KeyVaultClient keyVaultClient = new KeyVaultClient(credentials);
		//String secret  = keyVaultClient.getSecret("https://TestKeyValut2019.vault.azure.net","testpgdbadminsecret").value();
	
		
		//logger.info(secret);
	    if (loginForm.getUserName() == null || loginForm.getPassword() == null
				|| !loginForm.getUserName().equalsIgnoreCase("Microsoft")
				|| !loginForm.getPassword().equals("microsoft")) {
			logger.info("***Login Failed***");
			return mapping.findForward("failure");
		} else
			logger.info("***Login Passed***");
			return mapping.findForward("success");
	}
	
	

}
