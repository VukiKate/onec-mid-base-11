
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	//{{17.10.24 Вуйко ДЗ Командная работа (EDT)
	//Добавить элемент Согласованный скидка и команду Пересчитать таблицу

	Знак = ДопустимыйЗнак.Неотрицательный;
	ПараметрыЧисла = Новый КвалификаторыЧисла(5,2,Знак);
	ТипРеквизита = Новый ОписаниеТипов("Число", ПараметрыЧисла);
	
	ДобавляемыеРеквизиты = Новый Массив;
	
	РеквизитФормы = Новый РеквизитФормы("СогласованнаяСкидка", ТипРеквизита,"", "СогласованнаяСкидка");
	ДобавляемыеРеквизиты.Добавить(РеквизитФормы);
	
	ИмяЭлемента = "СогласованнаяСкидка";
	
	Если Элементы.Найти(ИмяЭлемента) = Неопределено Тогда
		ЭлементФормы = Элементы.Добавить(ИмяЭлемента, Тип("ПолеФормы"), Элементы.ГруппаШапкаЛево);        
		ЭлементФормы.Вид = ВидПоляФормы.ПолеВвода;
		ЭлементФормы.ПутьКДанным = "Объект.ДЗ_СогласованнаяСкидка";
		ЭлементФормы.УстановитьДействие("ПриИзменении","Доп_СогласованнаяСкидкаПриИзменении"); 
	КонецЕсли;
	
	
	НоваяКоманда = Команды.Добавить("КомандаПересчитатьТаблицу");
	НоваяКоманда.Действие = "ПересчитатьТаблицу";//Имя процедуры
	НоваяКоманда.Заголовок = "Пересчитать таблицу";
	
	НовыйЭлемент = Элементы.Добавить("ЭлементПересчитатьТаблицу",
	Тип("КнопкаФормы"),
	Элементы.ГруппаШапкаЛево);
	НовыйЭлемент.ИмяКоманды = "КомандаПересчитатьТаблицу";
	//17.10.24 Вуйко }}//
	
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	//{{17.10.24 Вуйко ДЗ Командная работа (EDT)
	//Пересчитать сумму с учетом скидки
    //Предыдущий код:
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
	 ТекущиеДанные.Сумма = ТекущиеДанные.Количество * (ТекущиеДанные.Цена - ТекущиеДанные.Цена * Объект.ДЗ_СогласованнаяСкидка / 100);        
	 РассчитатьСуммуДокумента();
	//17.10.24 Вуйко }}//
	
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

&НаКлиенте
Процедура ПересчитатьТаблицу(Команда)
	//{{17.10.24 Вуйко ДЗ Командная работа (EDT)
	//Добавить обработчик команды
	СтоимостьСУчетомСкидки();
	//17.10.24 Вуйко }}//
КонецПроцедуры	


&НаКлиенте
Процедура СтоимостьСУчетомСкидки()
	//{{17.10.24 Вуйко ДЗ Командная работа (EDT)
	//Добавить обработчик команды
	Для Каждого СтрокаТЧ Из Объект.Товары Цикл
		РассчитатьСуммуСтроки(СтрокаТЧ);
	КонецЦикла;
	
	Для Каждого СтрокаТЧ Из Объект.Услуги Цикл
		РассчитатьСуммуСтроки(СтрокаТЧ);
	КонецЦикла;
	//17.10.24 Вуйко }}//
КонецПроцедуры	


&НаКлиенте
Процедура Доп_СогласованнаяСкидкаПриИзменении(Элемент)
	//{{17.10.24 Вуйко ДЗ Командная работа (EDT)
	//При изменении скидки задать вопрос
	ЗадатьВопросАсинх();
	//17.10.24 Вуйко }}//
КонецПроцедуры

&НаКлиенте
Асинх Процедура ЗадатьВопросАсинх()
	//{{17.10.24 Вуйко ДЗ Командная работа (EDT)
	//При изменении скидки задать вопрос и пересчитать сумму
	Если Объект.Товары.Количество() = 0 И Объект.Услуги.Количество() = 0 Тогда
		Возврат;
	Иначе 
		Обещание = ВопросАсинх("Изменен процент скидки: пересчитать сумму в таблицах товаров и услуг?", РежимДиалогаВопрос.ДаНет);
		Результат = Ждать Обещание;
		
		Если Результат = КодВозвратаДиалога.Да Тогда
			СтоимостьСУчетомСкидки();
		ИначеЕсли 
			Результат = КодВозвратаДиалога.Нет Тогда
			Возврат;
		КонецЕсли;
	КонецЕсли;
	//17.10.24 Вуйко }}//
КонецПроцедуры



#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
