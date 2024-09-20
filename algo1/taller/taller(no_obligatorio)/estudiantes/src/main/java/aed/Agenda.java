package aed;

import java.util.Vector;

public class Agenda {

    public Agenda(Fecha fechaActual) {
        _fecha = fechaActual;
    }

    public void agregarRecordatorio(Recordatorio recordatorio) {
        this._recordatorios.add(recordatorio);
    }

    @Override
    public String toString() {
        StringBuffer s1b = new StringBuffer();

        s1b.append(_fecha + "\n" + "=====" + "\n");
        for (int i = 0; i < _recordatorios.size(); i++) {
            s1b.append(_recordatorios.get(i).toString() + "\n");
        }
        return s1b.toString();
    }

    public void incrementarDia() {
        _fecha.incrementarDia();
    }

    public Fecha fechaActual() {
        return _fecha;
    }

    private Fecha _fecha;

    private Vector<Recordatorio> _recordatorios = new Vector<Recordatorio>(0, 0);
}
