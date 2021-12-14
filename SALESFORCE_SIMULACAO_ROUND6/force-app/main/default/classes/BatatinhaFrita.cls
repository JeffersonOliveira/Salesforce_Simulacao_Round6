public class BatatinhaFrita {
    public void execute(Id idPartida) {
        ParticipantePartida__c[] Participantes = [SELECT Id, Jogador__c FROM ParticipantePartida__c WHERE Partida__c = :idPartida];
        
        Jogador__c[] jogadores = New List<Jogador__c>();
        
        Integer mortes = (Integer) participantes.size() / 2;
        
        for(Integer i = 0 ; i < mortes ; i++){
            
            
            jogador__c jogador = new Jogador__c(Id = Participantes[i].Jogador__c, Eliminado__c = true);
            jogadores.add(jogador);
            
        	//jogadores.add(new Jogador__c(Id = Participantes[i].Jogador__c, Eliminado__c = true));
        }
        update jogadores;
        
        Partida__c partida = new Partida__c(Id = idPartida, TerminoPartida__c = System.now());
        //update new Partida__c(Id = idPartida, TerminoPartida__c = System.now());
       
        update partida;
    }
       
}