import '../models/mission.dart';

const demoMissions = <Mission>[
  Mission(
    id: 'radiacao-natural',
    title: 'RadiaÃ§Ã£o ao nosso redor',
    subtitle: 'Explore a radiaÃ§Ã£o natural',
    description: 'Observe uma leitura simulada e descubra que a radiaÃ§Ã£o natural faz parte do ambiente. Os valores sÃ£o fictÃ­cios e servem apenas para aprendizagem.',
    iconCode: 0xe3a6,
    points: 30,
    duration: '5 min',
  ),
  Mission(
    id: 'meia-vida',
    title: 'Viagem pela meia-vida',
    subtitle: 'Entenda o decaimento',
    description: 'Acompanhe uma simulaÃ§Ã£o visual de decaimento e veja como a quantidade de Ã¡tomos instÃ¡veis muda com o tempo.',
    iconCode: 0xe3a6,
    points: 40,
    duration: '7 min',
  ),
  Mission(
    id: 'protecao',
    title: 'CiÃªncia e proteÃ§Ã£o',
    subtitle: 'ConheÃ§a os princÃ­pios bÃ¡sicos',
    description: 'Aprenda como tempo, distÃ¢ncia e blindagem ajudam a explicar a proteÃ§Ã£o radiolÃ³gica.',
    iconCode: 0xe3a6,
    points: 35,
    duration: '6 min',
  ),
];

const demoReadings = <Map<String, Object>>[
  {
    'place': 'Escola Horizonte',
    'city': 'SÃ£o Paulo, SP',
    'value': 0.12,
    'date': 'Hoje',
  },
  {
    'place': 'ColÃ©gio das CiÃªncias',
    'city': 'Santos, SP',
    'value': 0.09,
    'date': 'Ontem',
  },
  {
    'place': 'Instituto Aprender',
    'city': 'Campinas, SP',
    'value': 0.15,
    'date': '28 out',
  },
];

const marieAnswers = <String, String>{
  'radia': 'RadiaÃ§Ã£o Ã© energia que se propaga pelo espaÃ§o ou por um meio. Ela pode ser encontrada em fenÃ´menos naturais e em tecnologias do cotidiano.',
  'meia-vida': 'Meia-vida Ã© o tempo necessÃ¡rio para que metade dos nÃºcleos instÃ¡veis de uma amostra decaia. Ã‰ uma caracterÃ­stica de cada isÃ³topo.',
  'seguranÃ§a': 'Na proteÃ§Ã£o radiolÃ³gica, aprendemos sobre reduzir o tempo de exposiÃ§Ã£o, aumentar a distÃ¢ncia da fonte e usar blindagem adequada.',
  'curie': 'O CURIE aproxima estudantes da ciÃªncia nuclear com missÃµes educativas e experimentos simulados. Nesta Sprint, todas as leituras sÃ£o fictÃ­cias.',
};
