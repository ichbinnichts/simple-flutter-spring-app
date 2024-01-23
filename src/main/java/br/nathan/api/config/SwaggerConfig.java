package br.nathan.api.config;


import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.servers.Server;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class SwaggerConfig  {

    @Value("nathan.openapi.dev-url")
    private String devUrl;

    @Value("nathan.openapi.prod-url")
    private String prodUrl;

    @Bean
    public OpenAPI publicApi(){
        Server devServer = new Server();
        devServer.setUrl(devUrl);
        devServer.setDescription("Server url in development environment");

        Server prodServer = new Server();
        prodServer.setUrl(prodUrl);
        prodServer.setDescription("Server url in production environment");

        Contact contact = new Contact();
        contact.setEmail("nathanfaria607@gmail.com");
        contact.setName("Nathan Faria");

        Info info = new Info().title("My public API").version("1.0").contact(contact).description("Api of employees contained id, first name and last name");

        return new OpenAPI().info(info).servers(List.of(devServer, prodServer));
    }
}
