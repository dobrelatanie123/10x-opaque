### Główny problem
Nikt nie czyta regulaminów w trakcie zakładania kont na serwisach internetowych. Tworzący te regulaminy to wiedzą, dlatego jeszcze bardziej je komplikują i piszą językiem, który jest niezrozumiały dla uytkownika. Niestety akceptując regulaminy często nie zdajemy sobie sprawy z tego, ze godzimy się na coś, na co byśmy się nie zgodzili, jeśli byśmy to zrozumieli lub przeczytali. 


### Najmniejszy zestaw funkcjonalności
- Mozliwość wklejenia url do regulaminu
- Analiza regulaminu przez LLM
- Zidentyfikowanie potencjalnie zagrazajacych uzytkownikowi zapisów w regulaminie
- Podsumowanie regulaminu w skali 0-10, gdzie 0 to regulamin bardzo sprzyjający uzytkownikowi, a 10 niezwykle niesprzyjajacy i wręcz ocierający się o niedozwolone praktyki
- Zapisywanie analizy konkretnych stron w bazie danych
- Dostępna publicznie lista przeanalizowanych stron z bazy danych dla uzytkownikow - sekcja dla community
- Tworzenie kont uzytkownikow
- Model biznesowy, polegajacy na jednej dostepnej darmowej analizie per konto uzytkownika, kazda nastepna analiza kosztuje 1 eur
- Mozliwosc dostepu do jednej analizy z sekcji dla community za darmo, otwarcie kazdej ponownej rowniez kosztuje 1 eur
- Mozliwosc feedbackowania analiz przez uzytkownika - lapka do gory, lapka w dol, przechowywanie score'u w bazie danych dla analizy


### Co NIE wchodzi w zakres MVP
- Aplikacje mobilne na początek tylko web
- Wersjonowanie tlumaczen analiz
- 

### Kryteria sukcesu
- Wszystkie analizy maja 80% score pozytywny (czyli dla 10 glosow: 8 jest lapka w gore, 2 lapka w dol)
