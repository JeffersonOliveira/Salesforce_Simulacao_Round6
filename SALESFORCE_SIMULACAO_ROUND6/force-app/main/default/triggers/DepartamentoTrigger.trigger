trigger DepartamentoTrigger on Departamentos__c (after insert, before insert) {

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            DepartamentoTriggerHandler.beforeInsert(Trigger.new);
            // if (SemFuncionarios){
            //     Trigger.New.get(Departamentos__c.Name).addError('sem funcionarios.');
            // }
        }
    } else if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            DepartamentoTriggerHandler.afterInsert(Trigger.new);
        }
    }

}