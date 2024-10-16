# flutter_microsoft_clarity

## Descrição
O `flutter_microsoft_clarity` é um plugin Flutter que permite a integração da análise do Microsoft Clarity em seu aplicativo Flutter. O Microsoft Clarity é uma ferramenta de análise que fornece insights sobre o comportamento do usuário, ajudando a entender como os usuários interagem com seu aplicativo.

## Funcionalidades
- **Captura de Eventos**: Registre eventos personalizados para monitorar ações específicas dos usuários.
- **Análise de Sessões**: Visualize como os usuários navegam pelo seu aplicativo com gravações de sessão.
- **Mapas de Calor**: Obtenha mapas de calor que mostram onde os usuários clicam e como eles interagem com a interface.

## Instalação
Para adicionar o `flutter_microsoft_clarity` ao seu projeto, adicione a seguinte linha ao seu arquivo `pubspec.yaml`:

```yaml
dependencies:
  flutter_microsoft_clarity: ^0.0.1
```

## Uso

### Inicialização

Antes de usar o plugin, você precisa inicializar o Clarity com o token de API fornecido pelo Microsoft. Adicione o seguinte código ao seu arquivo principal (geralmente `main.dart`):

```dart
import 'package:flutter_microsoft_clarity/flutter_microsoft_clarity.dart';

void main() {
  FlutterMicrosoftClarity.initialize(apiToken: 'SEU_TOKEN_DE_API');
  runApp(MyApp());
}
```

