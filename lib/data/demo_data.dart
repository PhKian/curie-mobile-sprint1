import '../models/mission.dart';

const demoMissions = <Mission>[
  Mission(
    id: 'radiacao-natural',
    title: 'RadiaÃƒÂ§ÃƒÂ£o ao nosso redor',
    subtitle: 'Explore a radiaÃƒÂ§ÃƒÂ£o natural',
    description: 'Observe uma leitura simulada e descubra que a radiaÃƒÂ§ÃƒÂ£o natural faz parte do ambiente. Os valores sÃƒÂ£o fictÃƒÂ­cios e servem apenas para aprendizagem.',
    iconCode: 0xe3a6,
    points: 30,
    duration: '5 min',
  ),
  Mission(
    id: 'meia-vida',
    title: 'Viagem pela meia-vida',
    subtitle: 'Entenda o decaimento',
    description: 'Acompanhe uma simulaÃƒÂ§ÃƒÂ£o visual de decaimento e veja como a quantidade de ÃƒÂ¡tomos instÃƒÂ¡veis muda com o tempo.',
    iconCode: 0xe3a6,
    points: 40,
    duration: '7 min',
  ),
  Mission(
    id: 'protecao',
    title: 'CiÃƒÂªncia e proteÃƒÂ§ÃƒÂ£o',
    subtitle: 'ConheÃƒÂ§a os princÃƒÂ­pios bÃƒÂ¡sicos',
    description: 'Aprenda como tempo, distÃƒÂ¢ncia e blindagem ajudam a explicar a proteÃƒÂ§ÃƒÂ£o radiolÃƒÂ³gica.',
    iconCode: 0xe3a6,
    points: 35,
    duration: '6 min',
  ),
];

const demoReadings = <Map<String, Object>>[
  {
    'place': 'Escola Horizonte',
    'city': 'SÃƒÂ£o Paulo, SP',
    'value': 0.12,
    'date': 'Hoje',
  },
  {
    'place': 'ColÃƒÂ©gio das CiÃƒÂªncias',
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
  'radia': 'RadiaÃƒÂ§ÃƒÂ£o ÃƒÂ© energia que se propaga pelo espaÃƒÂ§o ou por um meio. Ela pode ser encontrada em fenÃƒÂ´menos naturais e em tecnologias do cotidiano.',
  'meia-vida': 'Meia-vida ÃƒÂ© o tempo necessÃƒÂ¡rio para que metade dos nÃƒÂºcleos instÃƒÂ¡veis de uma amostra decaia. Ãƒâ€° uma caracterÃƒÂ­stica de cada isÃƒÂ³topo.',
  'seguranca': 'Na proteÃƒÂ§ÃƒÂ£o radiolÃƒÂ³gica, aprendemos sobre reduzir o tempo de exposiÃƒÂ§ÃƒÂ£o, aumentar a distÃƒÂ¢ncia da fonte e usar blindagem adequada.',
  'curie': 'O CURIE aproxima estudantes da ciÃƒÂªncia nuclear com missÃƒÂµes educativas e experimentos simulados. Nesta Sprint, todas as leituras sÃƒÂ£o fictÃƒÂ­cias.',
};

