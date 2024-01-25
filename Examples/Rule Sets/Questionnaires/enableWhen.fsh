// this question will only be shown when another question has been answered as 'true'
RuleSet: enableWhenCode(question, code)
* enableWhen
  * question = "{question}"
  * operator = #=
  * answerBoolean = {code}

RuleSet: enableWhenComorbidity(code)
* insert enableWhenCode(comorbidities, {code})

ValueSet: ComorbidityHistory
Id: ComorbidityHistory
Title: "Comorbidity history"
Description: "Documented history of comorbidities"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include SCT#363443007 "Malignant tumour of ovary"
* include SCT#35489007  "Depression"

Instance: TestQuestionnaire
InstanceOf: Questionnaire
Usage: #definition
Description: "Test Questionnaire to demonstrate enableWhen"

* name = "TestQuestionnaire"
* title = "Test Questionnaire to demonstrate enableWhen"
* status = #draft

* item[+]
  * linkId = "general-information"
  * type = #group
  * text = "General information"
  * required = true

  * item[+]
    * linkId = "age-known"
    * type = #boolean
    * text = "Do you remember how old you are?"
    * required = true

  * item[+]
    * linkId = "age"
    * type = #integer
    * text = "So how old are you?"
    * required = true
    * insert enableWhenCode(age-known, true)

  * item[+]
    * linkId = "comorbidities"
    * type = #choice
    * text = "Have you been told by a doctor that you have any of the following?"
    * answerValueSet = Canonical(ComorbidityHistory)
    * required = true
    * repeats = true

  * item[+]
    * linkId = "depression-treatment"
    * type = #boolean
    * text = "Do you receive treatment for depression?"
    * insert enableWhenComorbidity(SCT#35489007)
