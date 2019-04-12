package com.tests;

import java.net.URL;

import org.openqa.selenium.By;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class WebDriverDemo {

	public static void main(String[] args) throws Exception {
		//WebDriver driver = new ChromeDriver();
		WebDriver driver = new RemoteWebDriver(new URL("http://54.153.77.76:4444/wd/hub"),
				new DesiredCapabilities("firefox", "", Platform.LINUX));
		
		driver.get("http://www.google.com");
		
		WebElement searchField = driver.findElement(By.id("lst-ib"));
		searchField.sendKeys("pluralsight");
		searchField.submit();
		
		//driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		WebDriverWait wait = new WebDriverWait(driver, 10);
		wait.until(ExpectedConditions.presenceOfElementLocated(By.linkText("Images")));
		
		WebElement imagesLink = driver.findElements(By.linkText("Images")).get(0);
		imagesLink.click();
		
		WebElement imageElement = driver.findElements(By.cssSelector("a[class = rg_l]")).get(0);
		WebElement imageLink = imageElement.findElements(By.tagName("img")).get(0);
		imageLink.click();
	}
}
