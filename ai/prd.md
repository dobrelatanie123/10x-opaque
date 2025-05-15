# Dokument wymagań produktu (PRD) - Regulamin Analyzer

## 1. Przegląd produktu
Opaque to aplikacja webowa umożliwiająca użytkownikom wklejenie URL do regulaminu, która następnie analizuje dokument za pomocą LLM. System identyfikuje potencjalne zagrożenia, takie jak przekazywanie danych, ukryte koszty, ryzyko prawne, szczegóły dotyczące udostępniania danych oraz informacje o możliwości usunięcia konta i danych. Wyniki analizy są oceniane na stałej skali 0–10, a pełny raport jest przechowywany w historii analiz wraz z datą wykonania oraz datą obowiązywania regulaminu. Dodatkowo, interfejs użytkownika oferuje elementy objaśniające wyniki (np. tooltipy).

## 2. Problem użytkownika
Użytkownicy nie czytają regulaminów, gdyż są one zbyt długie i napisane skomplikowanym językiem. W efekcie akceptują zapisy, które mogą negatywnie wpłynąć na ich prywatność i finanse, jak przekazywanie danych, ukryte koszty oraz ryzyko prawne. Brak przejrzystości skutkuje nieświadomą zgodą na niekorzystne warunki.

## 3. Wymagania funkcjonalne
1. Umożliwienie wklejenia URL do regulaminu.
2. Analiza regulaminu przy użyciu LLM z identyfikacją zagrożeń, w tym:
   - Przekazywanie danych osobowych.
   - Ukryte koszty.
   - Ryzyko prawne.
   - Szczegóły dotyczące udostępniania danych.
   - Informacje o możliwości usunięcia konta i danych.
3. Ocena precyzji i klarowności regulaminu na skali 0–10.
4. Ograniczenie długości wejściowego tekstu (tokenizacja) w celu utrzymania kosztu analizy poniżej 1 zł.
5. Zapisywanie pełnego raportu analizy w historii wraz z datą wykonania oraz datą obowiązywania regulaminu.
6. Integracja z narzędziami analitycznymi (Post Hog, Stripe) do zbierania podstawowych metryk, takich jak liczba odwiedzin, kliknięć i konwersji.
7. Interfejs użytkownika zawierający dodatkowe elementy objaśniające wyniki analizy (np. tooltipy, sekcja wyjaśniająca).

## 4. Granice produktu
1. MVP obejmuje tylko wersję webową; aplikacja mobilna nie jest uwzględniona.
2. Wersjonowanie tłumaczeń analiz nie jest częścią początkowego zakresu.
3. Interakcje społeczne między użytkownikami, poza podstawowym systemem głosowania, nie są przewidziane.
4. Zaawansowana personalizacja i konfiguracja kryteriów analizy pozostają poza MVP.

## 5. Historyjki użytkowników

US-001  
Tytuł: Analiza regulaminu na podstawie URL  
Opis: Jako użytkownik chcę wkleić URL regulaminu, aby otrzymać szybką analizę identyfikującą potencjalne zagrożenia oraz ocenę dokumentu na skali 0–10.  
Kryteria akceptacji:
- Użytkownik wkleja prawidłowy URL.
- System generuje raport zawierający identyfikację zagrożeń i ocenę regulaminu.
- Wyniki analizy są prezentowane w przejrzystym formacie z elementami objaśniającymi.

US-002  
Tytuł: Dostęp do historii analiz  
Opis: Jako zarejestrowany użytkownik chcę mieć dostęp do historii moich analiz, aby móc przeglądać poprzednie raporty wraz z datami wykonania i obowiązywania regulaminów.  
Kryteria akceptacji:
- System zapisuje każdy raport analizy z datą wykonania i datą obowiązywania regulaminu.
- Użytkownik może wyświetlić historię analiz w chronologicznej kolejności.
- Możliwość otwarcia pełnego raportu po kliknięciu na zapis.

US-003  
Tytuł: Rejestracja i uwierzytelnienie użytkownika  
Opis: Jako nowy użytkownik chcę zarejestrować konto i zalogować się, aby uzyskać dostęp do historii analiz oraz innych funkcji zabezpieczonych przed nieautoryzowanym dostępem.  
Kryteria akceptacji:
- Użytkownik może utworzyć konto, podając podstawowe dane (np. email, hasło).
- System umożliwia logowanie i prawidłową autoryzację.
- Dostęp do historii i chronionych funkcji jest dostępny tylko po zalogowaniu.

US-004  
Tytuł: Ograniczenie długości wejściowego tekstu  
Opis: Jako użytkownik chcę, aby system ograniczał długość analizowanego tekstu, tak aby koszt analizy nie przekroczył 1 zł.  
Kryteria akceptacji:
- System wstępnie weryfikuje długość lub liczbę tokenów w wklejanym regulaminie.
- W przypadku przekroczenia ustalonego limitu, użytkownik otrzymuje komunikat o błędzie.
- Analiza jest wykonywana tylko wtedy, gdy wejściowy tekst mieści się w ustalonym limicie tokenów.

## 6. Metryki sukcesu
1. Utrzymanie kosztu pojedynczej analizy poniżej 1 zł dzięki optymalizacji tokenizacji.
2. Osiągnięcie wysokiej jakości wyników analizy, ocenianych na stałej skali 0–10, z celem uzyskania minimum 80% pozytywnych ocen według użytkowników.
3. Wzrost liczby użytkowników oraz wysoki poziom rejestracji i korzystania z aplikacji.
4. Pozytywne metryki interakcji z interfejsem, takie jak liczba odwiedzin, kliknięcia i konwersje monitorowane przez narzędzia analityczne.
5. Szybki czas generowania raportu po wklejeniu URL, zapewniający płynne doświadczenie użytkownika.