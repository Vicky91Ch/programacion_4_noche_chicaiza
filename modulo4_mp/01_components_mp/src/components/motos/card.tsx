import { ReactNode } from 'react';
import { StyleSheet, Text, View } from 'react-native';

interface CardProps {
  titulo: string;
  subtitulo?: string;
  children: ReactNode;
  color?: string;
}

export function Card({ titulo, subtitulo, children, color }: CardProps) {
  return (
    <View style={styles.card}>
      <View style={[styles.cardHeader, { backgroundColor: color ?? '#1565C0' }]}>
        <Text style={styles.cardTitle}>{titulo}</Text>
        {subtitulo && <Text style={styles.cardSubtitle}>{subtitulo}</Text>}
      </View>
      <View style={styles.cardBody}>{children}</View>
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#ffffff',
    borderRadius: 12,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOpacity: 0.07,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
    elevation: 3,
  },
  cardHeader: {
    paddingHorizontal: 16,
    paddingVertical: 12,
    gap: 2,
  },
  cardTitle: {
    fontSize: 16,
    fontWeight: '700',
    color: '#ffffff',
  },
  cardSubtitle: {
    fontSize: 12,
    color: '#BBDEFB',
  },
  cardBody: {
    padding: 12,
    gap: 8,
  },
});