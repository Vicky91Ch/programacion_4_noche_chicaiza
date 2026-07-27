import { StyleSheet, Text, View } from 'react-native';

interface FilaInfoProps {
  etiqueta: string;
  valor: string;
}

export function FilaInfo({ etiqueta, valor }: FilaInfoProps) {
  return (
    <View style={styles.row}>
      <Text style={styles.label}>{etiqueta}</Text>
      <Text style={styles.value}>{valor}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  label: {
    fontSize: 13,
    color: '#546E7A',
    fontWeight: '500',
  },
  value: {
    fontSize: 13,
    color: '#1A1A1A',
    fontFamily: 'monospace',
  },
});