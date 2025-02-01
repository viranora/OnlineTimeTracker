package org.onlinetimetracker;

import io.github.cdimascio.dotenv.Dotenv;
import org.onlinetimetracker.config.DotenvConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class
OnlineTimeTrackerApplication {

	public static void main(String[] args) {
		// Dotenv kullanarak çevresel değişkenlerin uygulama başlarken yüklenmesi, bunu .gitignore'ye ekleyeceğiz
		//Dotenv dotenv = Dotenv.configure().directory("./src/main/resources").load();
		DotenvConfig DotenvConfig = new DotenvConfig();
		Dotenv dotenv = DotenvConfig.dotenv();
		System.setProperty("DB_URI", dotenv.get("DB_URI"));
		SpringApplication.run(OnlineTimeTrackerApplication.class, args);
	}
}