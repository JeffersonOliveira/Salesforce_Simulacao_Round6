public with sharing class FuncionariosSelector {

    public static List<Funcionarios__c> selectByFuncionariosWithTrabalhandoIsFalseIsNotCargosEqualsTriangulo() {
        //TODO: Paremetrizar os campos de condição ; Tentativa com DISTINCT Failed;
        return [
            SELECT name, toLabel(Cargo__c), trabalhando__c
            FROM Funcionarios__c 
            WHERE 
                Trabalhando__c = FALSE AND 
                Cargo__c <> 'Triângulo' 
        ];
    }
}