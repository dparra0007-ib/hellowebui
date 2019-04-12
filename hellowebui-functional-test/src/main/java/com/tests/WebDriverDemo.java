package com.tests;

import java.net.URL;
import java.util.List;
import java.util.Objects;

import org.openqa.selenium.By;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

public class WebDriverDemo {

	public static void main(String[] args) throws Exception {
		//WebDriver driver = new ChromeDriver();
		WebDriver driver = new RemoteWebDriver(new URL("http://localhost:4444/wd/hub"),
				new DesiredCapabilities("firefox", "", Platform.MAC));
		
		driver.get("http://52.53.204.53");
		
		WebElement maindivelement = driver.findElement(By.className("container"));
		List<WebElement> paras = maindivelement.findElements(By.tagName("p"));
		//System.out.println("Size = " + paras.size() + "   " + paras.toString() );
		if(paras.size() != 1) throw new Exception("More than one paragraph");
		else
		{
			//System.out.println(paras.get(0).getText());
			if(Objects.equals(paras.get(0).getText(), "This is a test message") == false) throw new Exception("Wrong text");
			//if(paras.get(0).getText() != "This is a test message") throw new Exception("Wrong text");
		}
		System.out.println("Testing fine!");
	}
}
