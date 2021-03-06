#Область СлужебныйПрограммныйИнтерфейс

Функция ПолучитьДопустимуюМаску() Экспорт
	
	Возврат "[a-zA-Z][a-zA-Z0-9\.]+";
	
КонецФункции

Функция ПолучитьСоединение() Экспорт
	
	НазванияКонстант = "осСервер,осПорт,осТаймаут,осПользователь,осПароль";
	НаборКонстант = Константы.СоздатьНабор(НазванияКонстант);
	НаборКонстант.Прочитать();											
											
	
	//Если СтруктураНастроекСоединения.ЗащищенноеСоединение Тогда
	//	Протокол = "https";
	//Иначе
		Протокол = "http";
	//КонецЕсли;
	
	//Если СтруктураНастроекСоединения.ИспользоватьПрокси Тогда
	//	Прокси = Новый ИнтернетПрокси;
	//	Прокси.Пользователь = СтруктураНастроекСоединения.ПроксиПользователь;
	//	Прокси.Пароль = СтруктураНастроекСоединения.ПроксиПароль;
	//	Если СтруктураНастроекСоединения.ПроксиИспользоватьАутентификациюОС Тогда
	//		Прокси.Установить(
	//		Протокол,
	//		СтруктураНастроекСоединения.ПроксиСервер,
	//		СтруктураНастроекСоединения.ПроксиПорт,
	//		СтруктураНастроекСоединения.ПроксиПользователь,
	//		СтруктураНастроекСоединения.ПроксиПароль,
	//		СтруктураНастроекСоединения.ПроксиИспользоватьАутентификациюОС);
	//	КонецЕсли;
	//КонецЕсли;
	
	Соединение = Новый HTTPСоединение(НаборКонстант.осСервер,
									  НаборКонстант.осПорт,
									  НаборКонстант.осПользователь,
									  НаборКонстант.осПароль,
									  ,
									  НаборКонстант.осТаймаут);
	Возврат Соединение;

КонецФункции

#КонецОбласти