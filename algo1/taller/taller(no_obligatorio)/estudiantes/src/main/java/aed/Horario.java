package aed;

public class Horario {

    public Horario(int hora, int minutos) {
        _hora = hora;
        _minutos = minutos;
    }

    public int hora() {
        return _hora;
    }

    public int minutos() {
        return _minutos;
    }

    @Override
    public String toString() {
        StringBuffer sBuffer = new StringBuffer();
        sBuffer.append(_hora);
        sBuffer.append(":");
        sBuffer.append(_minutos);
        return sBuffer.toString();
    }

    @Override
    public boolean equals(Object otro) {
        boolean oen = (otro == null);
        boolean cd = otro.getClass() != this.getClass();
        
        if (oen || cd) {
            return false;
        }

        Horario otroHorario = (Horario) otro;

        return this._hora == otroHorario._hora && this._minutos == otroHorario._minutos;
    }

    private int _hora;

    private int _minutos;
}
