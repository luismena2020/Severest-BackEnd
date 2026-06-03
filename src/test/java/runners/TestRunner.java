package runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testUsers() {
        //return Karate.run("classpath:features/usuarios/getUsuarios.feature");
        //return Karate.run("classpath:features/usuarios/getUsuarios.feature").("@todos");
        //return Karate.run("classpath:features/usuarios/getUsuarioById.feature");
 //       return Karate.run("classpath:features/usuarios/postUsuario.feature");
        //return Karate.run("classpath:features/usuarios/putUsuario.feature");
        return Karate.run("classpath:features/usuarios/deleteUsuario.feature");
    }
}