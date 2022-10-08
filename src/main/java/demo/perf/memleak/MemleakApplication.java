package demo.perf.memleak;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MemleakApplication {

    public static void main(String[] args) {
        SpringApplication.run(MemleakApplication.class, args);
    }

}
