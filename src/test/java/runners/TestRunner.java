package runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run(
                "classpath:features/usuarios/getUsuarios.feature"
        );
    }
}