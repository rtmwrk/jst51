Feature: GotoCinema.ru test
    Scenario: Test # 1. Functional positive test. Booking ticket for tomorrow on 10:00 seance in hall # 1
        Given user goto cinema "http://qamid.tmweb.ru/" page
        When user choice ticket for "nav a + a" day
        When on "[data-seance-id='178']" seance
        When hall # ".buying-scheme__chair_standart"
        Then user booking ticket ".acceptin-button:disabled"

    Scenario: Test # 2. Functional positive test. Booking ticket for day after tomorrow on 15:00 seance in hall # 2
        Given user goto cinema "http://qamid.tmweb.ru/" page
        When user choice ticket for "nav a + a + a" day
        When on "[data-seance-id='173']" seance
        When hall # ".buying-scheme__chair_standart"
        Then user booking ticket ".acceptin-button:disabled"

    Scenario: Test # 3. Functional negative test. Booking ticket for day after tomorrow on 15:00 seance in hall # 2
        Given user goto cinema "http://qamid.tmweb.ru/" page
        When user choice ticket for "nav a + a + a" day
        When on "[data-seance-id='189']" seance
        When hall # ".buying-scheme__chair_standart"
        Then user booking ticket ".acceptin-button:disabled"