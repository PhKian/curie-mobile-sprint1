import '../models/mission.dart';

const demoMissions = <Mission>[
  Mission(
    id: 'radiacao-natural',
    title: 'Radiação ao nosso redor',
    subtitle: 'Explore a radiação natural',
    description: 'Observe uma leitura simulada e descubra que a radiação natural faz parte do ambiente. Os valores são fictícios e servem apenas para aprendizagem.',
    iconCode: 0xe3a6,
    points: 30,
    duration: '5 min',
  ),
  Mission(
    id: 'meia-vida',
    title: 'Viagem pela meia-vida',
    subtitle: 'Entenda o decaimento',
    description: 'Acompanhe uma simulação visual de decaimento e veja como a quantidade de átomos instáveis muda com o tempo.',
    iconCode: 0xe3a6,
    points: 40,
    duration: '7 min',
  ),
  Mission(
    id: 'protecao',
    title: 'Ciência e proteção',
    subtitle: 'Conheça os princípios básicos',
    description: 'Aprenda como tempo, distância e blindagem ajudam a explicar a proteção radiológica.',
    iconCode: 0xe3a6,
    points: 35,
    duration: '6 min',
  ),
  Mission(
    id: 'banana',
    title: 'A banana radioativa',
    subtitle: 'Radiação nos alimentos',
    description: 'Descubra por que a banana, rica em potássio-40, emite uma radiação natural pequena e inofensiva. Leitura simulada para fins educativos.',
    iconCode: 0xe3a6,
    points: 25,
    duration: '4 min',
  ),
];

const demoReadings = <Map<String, Object>>[
  {
    'place': 'Escola Horizonte',
    'city': 'São Paulo, SP',
    'value': 0.12,
    'date': 'Hoje',
  },
  {
    'place': 'Colégio das Ciências',
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
  'radia': 'Radiação é energia que se propaga pelo espaço ou por um meio. Ela pode ser encontrada em fenômenos naturais e em tecnologias do cotidiano.',
  'meia-vida': 'Meia-vida é o tempo necessário para que metade dos núcleos instáveis de uma amostra decaia. É uma característica de cada isótopo.',
  'seguranca': 'Na proteção radiológica, aprendemos sobre reduzir o tempo de exposição, aumentar a distância da fonte e usar blindagem adequada.',
  'curie': 'O CURIE aproxima estudantes da ciência nuclear com missões educativas e experimentos simulados. Nesta Sprint, todas as leituras são fictícias.',
};