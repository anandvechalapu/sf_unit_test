//Unit Test
@isTest
private class SurveyQuestionChoicesTest {

//Test generateAutoNumber()
    static testMethod void generateAutoNumberTest() {
        //Instantiate SurveyQuestionChoices Object
        SurveyQuestionChoices__c surveyQuestionChoices = new SurveyQuestionChoices__c();
        //Call generateAutoNumber()
        SurveyQuestionChoices.generateAutoNumber();
        //Insert surveyQuestionChoices
        insert surveyQuestionChoices;
        //Get auto number field
        Schema.SObjectField field = SurveyQuestionChoices__c.getDescribe().getAutoNumberField();
        //Verify auto number starts with SQC-00001
        System.assertEquals(field.getDescribe().getDefaultValue(), 'SQC-{00001}', 'Auto number not generated correctly');
    }

//Test createLookupRelation()
    static testMethod void createLookupRelationTest() {
        //Instantiate SurveyQuestionChoices Object
        SurveyQuestionChoices__c surveyQuestionChoices = new SurveyQuestionChoices__c();
        //Call createLookupRelation()
        SurveyQuestionChoices.createLookupRelation();
        //Get lookup field
        Schema.SObjectField field = SurveyQuestionChoices__c.getDescribe().getFields().getMap().get('SurveyQuestion__c');
        //Verify lookup field is of type Lookup
        System.assertEquals(field.getDescribe().getType(), Schema.DisplayType.Lookup, 'Lookup relation not created correctly');
    }

//Test createCustomField()
    static testMethod void createCustomFieldTest() {
        //Instantiate SurveyQuestionChoices Object
        SurveyQuestionChoices__c surveyQuestionChoices = new SurveyQuestionChoices__c();
        //Call createCustomField()
        SurveyQuestionChoices.createCustomField();
        //Get custom field
        Schema.SObjectField field = SurveyQuestionChoices__c.getDescribe().getFields().getMap().get('ChoiceName__c');
        //Verify custom field is of type Text Area
        System.assertEquals(field.getDescribe().getType(), Schema.DisplayType.TextArea, 'Custom field not created correctly');
    }

//Test createPageLayout()
    static testMethod void createPageLayoutTest() {
        //Call createPageLayout()
        SurveyQuestionChoices.createPageLayout();
        //Get page layout
        PageLayout layout = [SELECT Id FROM PageLayout WHERE Name = 'SurveyQuestionChoices'];
        //Verify page layout contains Choice Name field
        System.assertEquals(layout.getFields().size(), 1, 'Page Layout not created correctly');
        System.assertEquals(layout.getFields()[0], SurveyQuestionChoices__c.ChoiceName__c, 'Page Layout not created correctly');
    }

//Test createCustomTab()
    static testMethod void createCustomTabTest() {
        //Call createCustomTab()
        SurveyQuestionChoices.createCustomTab();
        //Get custom tab
        CustomTab tab = [SELECT Id FROM CustomTab WHERE Name = 'SurveyQuestionChoices'];
        //Verify Default on is true
        System.assertEquals(tab.IsDefaultOn, true, 'Custom Tab not created correctly');
    }

//Test createListView()
    static testMethod void createListViewTest() {
        //Call createListView()
        SurveyQuestionChoices.createListView();
        //Get list view
        ListView view = [SELECT Id FROM ListView WHERE DeveloperName = 'All_SurveyQuestionChoices'];
        //Verify list view contains SurveyQuestionChoices__c, ChoiceName__c fields
        System.assertEquals(view.getFieldsToDisplay().size(), 2, 'List View not created correctly');
        System.assertEquals(view.getFieldsToDisplay(), new List<String>{'SurveyQuestionChoices__c', 'ChoiceName__c'}, 'List View not created correctly');
        //Verify filter scope is Everything
        System.assertEquals(view.getFilterScope(), 'Everything', 'List View not created correctly');
    }
}