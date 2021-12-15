public with sharing class DepartamentoTriggerHandler {
    
    public static void beforeInsert(List<Departamentos__c> records) {
    //TODO: Refatorar, criando um classe para reaproveitar o código em novas funcionalidades futuras
        List<Funcionarios__c> funcionarios = FuncionariosSelector.selectByFuncionariosWithTrabalhandoIsFalseIsNotCargosEqualsTriangulo();

        integer quantidade_bola = 0;
        integer quantidade_quadrado = 0;
        Boolean SemFuncionarios = False;

        for (Funcionarios__c funcionario : funcionarios) {
            if (funcionario.Cargo__c == 'Bola'  ) {
                quantidade_bola++;
            }  else {
                quantidade_quadrado++;
            }
            if (quantidade_bola >= 1 && quantidade_quadrado >= 1) {
                break; // Tudo certo, pode gravar
            }
        }
        if ( quantidade_bola <=1 || quantidade_quadrado <= 1) {
            //TODO: Não permitir a crição do departamento quando não houver funcionários disponíveis.
            // SemFuncionarios = True;

        }
    }

    public static void afterInsert(List<Departamentos__c> records) {
        List<Funcionarios__c> funcionarios = FuncionariosSelector.selectByFuncionariosWithTrabalhandoIsFalseIsNotCargosEqualsTriangulo();
        
        List<Funcionarios__c> funcionarios_para_atualizar = new List<Funcionarios__c>();

        Boolean Bool_quadrado = False;
        Boolean Bool_bola = False;

        for (Funcionarios__c funcionario : funcionarios) {

            if (funcionario.Cargo__c == 'Bola' & Bool_bola == False) {
                Bool_bola = True;
                funcionario.Trabalhando__c = True;
                funcionarios_para_atualizar.add(funcionario);
            }

            if (funcionario.Cargo__c == 'Quadrado' & Bool_quadrado == False) {
                Bool_quadrado = True;
                funcionario.Trabalhando__c = True;
                funcionarios_para_atualizar.add(funcionario);
            }
        }

        update funcionarios_para_atualizar;
    }
}

// beforeUpdate - verificar se existe quadrado e bola sufientes e livres para trabalhar;

// afterUpdate departamento;	
// 	-> Seleciona um Quadrado disponível para ser o responsável para ser o gerente;
// afterUpdate departamento;	
// 	-> Seleciona um Bola disponível para ser um operador;
	
// Triangulo -> Gestor de turno (Gere 3 departamentos somente no seu turno)

// Quadrado(1) -> gerente de Turno e de departamento

// Bola(3) -> Operario ->
