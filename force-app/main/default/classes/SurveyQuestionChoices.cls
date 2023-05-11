public class SurveyQuestionChoices { 
    
    //Create a custom Object Survey Question Choices, with Label Name and Plural Label as Survey Question Choices
    public static SObjectType SurveyQuestionChoices__c { 
        get { return Schema.getGlobalDescribe().get('SurveyQuestionChoices'); }
    }
    
    //Create a Record Name as Survey Question Choices with Data Type as Auto Number and the Auto Number Format Should be SQC-{00001} with Starting Sting as 1
    public static void generateAutoNumber(){
        Schema.SObjectField field = SurveyQuestionChoices__c.getDescribe().getAutoNumberField();
        String numberValue = (String)field.getDescribe().getDefaultValue();
        String numberFormat = 'SQC-{00001}';
        field.getDescribe().setDefaultValue(numberFormat);
    }
    
    //Create Lookup relation between Survey Question Choices Object and Survey Question Object, whereas Survey Question Object is parent for Survey Question Choices Object
    public static void createLookupRelation(){
        Schema.SObjectField field = SurveyQuestionChoices__c.getDescribe().getFields().getMap().get('SurveyQuestion__c');
        Schema.DescribeFieldResult fieldDescribe = field.getDescribe();
        fieldDescribe.setType(Schema.DisplayType.Lookup);
        fieldDescribe.setReferenceTo('SurveyQuestion');
    }
    
    //Create Custom Field Choice Name with Data Type Text Area
    public static void createCustomField(){
        Schema.SObjectField field = SurveyQuestionChoices__c.getDescribe().getFields().getMap().get('ChoiceName__c');
        Schema.DescribeFieldResult fieldDescribe = field.getDescribe();
        fieldDescribe.setType(Schema.DisplayType.TextArea);
    }
    
    //Create a page layout for Survey Question Choices Object with the Fields Choice Name
    public static void createPageLayout(){
        PageLayout layout = new PageLayout(
            Name = 'SurveyQuestionChoices',
            Label = 'Survey Question Choices'
        );
        layout.setActive(true);
        layout.addFields(new List<Schema.SObjectField>{
            SurveyQuestionChoices__c.ChoiceName__c
        });
    }
    
    //Create custom Tab for Survey Question Choices Object with Default on, the users need to have access to Survey Question Choices Object
    public static void createCustomTab(){
        CustomTab tab = new CustomTab(
            Name = 'SurveyQuestionChoices',
            Label = 'Survey Question Choices'
        );
        tab.setDefaultOn(true);
        tab.setActive(true);
    }
    
    //Create a List view to display all the records with the fields  Survey Question Choices, Choice Name for Survey Question Choices Object with no list view filters
    public static void createListView(){
        ListView view = new ListView(
            SObjectType = SurveyQuestionChoices__c,
            DeveloperName = 'All_SurveyQuestionChoices',
            Name = 'All Survey Question Choices'
        );
        view.setFieldsToDisplay(new List<String>{
            'SurveyQuestionChoices__c',
            'ChoiceName__c'
        });
        view.setFilterScope('Everything');
    }
}