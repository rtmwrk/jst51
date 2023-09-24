const puppeteer = require("puppeteer");
const chai = require("chai");
const { Given, When, Then, Before, After } = require("cucumber");
const { clickElement, checkElementDisabled } = require("../../lib/commands.js");

Before(async function () {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  this.browser = browser;
  this.page = page;
});

After(async function () {
  if (this.browser) {
    await this.browser.close();
  }
});

Given("user goto cinema {string} page", async function (string) {
  await this.page.goto(`${string}`, { setTimeout: 20000 });
});

When("user choice ticket for {string} day", async function (string) {
  // Выбираем день
  await clickElement(this.page, `${string}`);
});

When("on {string} seance", async function (string) {
  // Выбираем сеанс
  await clickElement(this.page, `${string}`);
});

When("hall # {string}", async function (string) {
  // Выбираем место
  await clickElement(this.page, `${string}`);
});

Then("user booking ticket {string}", async function (string) {
  // Проверяем, что кнопка "Забронировать" enable
  await checkElementDisabled(this.page, `${string}`);
});
