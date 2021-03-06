
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Ключ.Пустая() Тогда
		Объект.Тип = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.СКД");		
	КонецЕсли;
		
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьВидимостьДоступностьЭлементовФормы()
	
	Если Объект.Тип = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.СКД") Тогда
		Элементы.СтраницыШаблонов.ТекущаяСтраница = Элементы.СтраницаШаблонСКД;
	Иначе
		Элементы.СтраницыШаблонов.ТекущаяСтраница = Элементы.СтраницаШаблонПроизвольныйКод;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ТипПриИзменении(Элемент)
	
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьСхемуКомпоновкиДанных(Команда)
	
	Режим = РежимДиалогаВыбораФайла.Открытие;
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(Режим);
	ДиалогОткрытияФайла.ПолноеИмяФайла = "";
	Фильтр = "XML (*.xml)|*.xml";
	ДиалогОткрытияФайла.Фильтр = Фильтр;
	ДиалогОткрытияФайла.МножественныйВыбор = Ложь;
	ДиалогОткрытияФайла.Заголовок = "Выберите файл";
	ДиалогОткрытияФайла.Показать(Новый ОписаниеОповещения("ЗагрузитьМакетИзФайлаЗавершение", ЭтотОбъект, Новый Структура("ДиалогОткрытияФайла", ДиалогОткрытияФайла))); 
	
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьМакетИзФайлаНаСервере(ТекстМакета)
	
	МакетСКД = ТекстМакета; 
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьМакетИзФайлаЗавершение(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт
	
	ДиалогОткрытияФайла = ДополнительныеПараметры.ДиалогОткрытияФайла; 	
	Если (ВыбранныеФайлы <> Неопределено) Тогда
		ЧтениеТекста = Новый ЧтениеТекста;
		ЧтениеТекста.Открыть(ДиалогОткрытияФайла.ПолноеИмяФайла);
		ТекстМакета = ЧтениеТекста.Прочитать();
		ЧтениеТекста.Закрыть();
		ЗагрузитьМакетИзФайлаНаСервере(ТекстМакета);
	КонецЕсли;
	
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры   

//#Область ОбработчикиСобытийФормы

//// На сервере:

//&НаСервере
//Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
//	
//	Если Параметры.Ключ.Пустая() Тогда
//		Объект.Тип = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.СКД");		
//	КонецЕсли;
//	
//	//Если Объект.Тип = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.СКД") Тогда
//		
//	

//	
//КонецПроцедуры

//&НаКлиенте
//Процедура ПриОткрытии(Отказ)

//КонецПроцедуры

//&НаКлиенте
//Процедура ПродолжитьЗакрытиеФормыДоСохранения(Ответ, ДополнительныеПараметры) Экспорт
//	Если Ответ = КодВозвратаДиалога.Да Тогда 
//		Записать();	
//		Закрыть();
//	ИначеЕсли Ответ = КодВозвратаДиалога.Нет Тогда		
//		РазрешитьЗакрытие = Истина;
//		Модифицированность = Ложь;
//		Закрыть();
//	КонецЕсли;	
//КонецПроцедуры

//&НаКлиенте
//Процедура ПродолжитьЗакрытиеФормы(Ответ, ДополнительныеПараметры) Экспорт
//	Если Ответ = КодВозвратаДиалога.Да Тогда 
//		ОткрытьФормуСпискаШаблоновПравилФильтрацииСОтбором(,Истина);	
//	ИначеЕсли Ответ = КодВозвратаДиалога.Нет Тогда		
//		РазрешитьЗакрытие = Истина;
//		Закрыть();
//	КонецЕсли;	
//КонецПроцедуры

//&НаКлиенте
//Процедура ПроизвольныйКодПриИзменении(Элемент)
//	Модифицированность = Истина;
//КонецПроцедуры

//#КонецОбласти

//#Область ОбработчикиКомандФормы

//&НаКлиенте
//Процедура ЗагрузитьМакетИзФайла(Команда)
//	
//	Режим = РежимДиалогаВыбораФайла.Открытие;
//	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(Режим);
//	ДиалогОткрытияФайла.ПолноеИмяФайла = "";
//	Фильтр = "XML (*.xml)|*.xml";
//	ДиалогОткрытияФайла.Фильтр = Фильтр;
//	ДиалогОткрытияФайла.МножественныйВыбор = Ложь;
//	ДиалогОткрытияФайла.Заголовок = "Выберите файл";
//	ДиалогОткрытияФайла.Показать(Новый ОписаниеОповещения("ЗагрузитьМакетИзФайлаЗавершение", ЭтотОбъект, Новый Структура("ДиалогОткрытияФайла", ДиалогОткрытияФайла))); 
//	
//КонецПроцедуры

//&НаКлиенте
//Процедура ДобавитьПравилоФильтрации(Команда)
//	Если Не ЗначениеЗаполнено(Объект.Ссылка) Тогда 
//		ПоказатьПредупреждение(,"Для добавления очереди необходимо записать текущий объект.");
//		Возврат;
//	КонецЕсли;
//	
//	ПараметрыОткрытия = Новый Структура;
//	ПараметрыОткрытия.Вставить("Отбор", Новый Структура("ТипОчереди", ПредопределенноеЗначение("Перечисление.осТипыОчередей.РегистрацияСобытий"))); 	
//	ОбработкаВыбораОчереди = Новый ОписаниеОповещения("ДобавитьПравилоФильтрацииОбработкаВыбораОчереди", ЭтаФорма);
//	
//	ОткрытьФорму("Справочник.осОчередиСообщений.ФормаВыбора", ПараметрыОткрытия, ЭтаФорма, УникальныйИдентификатор,,, ОбработкаВыбораОчереди, РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);	
//	
//КонецПроцедуры

//&НаКлиенте
//Процедура ДобавитьПравилоФильтрацииОбработкаВыбораОчереди(ВыбранноеЗначение, ДополнительныеПараметры) Экспорт
//	Если ВыбранноеЗначение = Неопределено Тогда 
//		Возврат;
//	КонецЕсли;	
//	ДобавитьПравилоФильтрацииНаСервере(ВыбранноеЗначение);	
//	Элементы.ОчередиСобытий.Обновить();
//КонецПроцедуры	

//&НаСервере
//Процедура ДобавитьПравилоФильтрацииНаСервере(Очередь);	
//	РегистрыСведений.осПрименимостьПравилФильтрацииДляОчередейСообщений.ДобавитьПравилоФильтрации(Очередь, Объект.Ссылка);
//КонецПроцедуры

//&НаКлиенте
//Процедура ОткрытьФормуСпискаСОтбором(Команда)
//	
//	Если Не ЗначениеЗаполнено(Объект.Ссылка) Тогда 
//		Возврат;
//	КонецЕсли;
//	
//	ОткрытьФормуСпискаШаблоновПравилФильтрацииСОтбором();
//	
//КонецПроцедуры

//&НаКлиенте
//Процедура ОткрытьФормуСпискаШаблоновПравилФильтрацииСОтбором(ТекстПредупреждения = "", ЗакрытьЭтуФормуПриЗакрытии = Ложь)

//	ПараметрыОткрытия = Новый Структура;
//	ПараметрыОткрытия.Вставить("Отбор", Новый Структура("ШаблонПравилаФильтрации", Объект.Ссылка)); 
//	ПараметрыОткрытия.Вставить("ПараметрОтбора", Объект.Ссылка); 	
//	ПараметрыОткрытия.Вставить("ПредупреждениеПриОткрытии", ТекстПредупреждения);
//	Если ЗакрытьЭтуФормуПриЗакрытии Тогда 
//		ИдентификаторЗакрытия = Строка(Новый УникальныйИдентификатор);
//		ПараметрыОткрытия.Вставить("ИдентификаторЗакрытия", ИдентификаторЗакрытия);
//	КонецЕсли;	
//	
//	ОткрытьФорму("Справочник.осПравилаОбработкиСобытий.Форма.ФормаПоиска", ПараметрыОткрытия, ЭтаФорма, УникальныйИдентификатор,,,,РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
//	
//КонецПроцедуры	
//	
//#КонецОбласти

//#Область СлужебныеПроцедурыИФункции

//&НаСервере
//Процедура СообщитьОбОшибке(ОписаниеОшибки, Поле)
//	
//	Сообщение = Новый СообщениеПользователю;
//	Сообщение.Текст = ОписаниеОшибки;
//	Сообщение.Поле = Поле;
//	Сообщение.Сообщить();
//	
//КонецПроцедуры

//&НаСервере
//Функция ПолучитьХешПараметров(ТекущийОбъект)
//	
//	Хеш = Новый ХешированиеДанных(ХешФункция.SHA256);
//	НачальнаяСтрока = "";
//	
//	Если ТекущийОбъект.ТипПравила = Перечисления.осТипыПравилФильтрации.ПроизвольныйКод Тогда 
//		НачальнаяСтрока = "ПроизвольныйКод";	
//	ИначеЕсли ТекущийОбъект.ТипПравила = Перечисления.осТипыПравилФильтрации.СКД Тогда	
//		НачальнаяСтрока = "СКД";	
//	КонецЕсли; 	
//	
//	Хеш.Добавить(НачальнаяСтрока);
//	Хеш.Добавить(ТекущийОбъект.Значение);
//	
//	Возврат СтрЗаменить(Строка(Хеш.ХешСумма)," ","");
//	
//КонецФункции

//&НаКлиенте
//Процедура УстановитьСтраницуПоТипуПравила()
//	
//	Если Объект.ТипПравила = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.СКД") Тогда 
//		Элементы.ГруппаТипыПравил.ТекущаяСтраница = Элементы.ТипПравилаСКД;	
//	ИначеЕсли Объект.ТипПравила = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.ПроизвольныйКод") Тогда
//		Элементы.ГруппаТипыПравил.ТекущаяСтраница = Элементы.ТипПравилаПроизвольныйКод;
//	Иначе
//		ВызватьИсключение "Неизвестный тип правила";
//	КонецЕсли;
//	
//КонецПроцедуры




