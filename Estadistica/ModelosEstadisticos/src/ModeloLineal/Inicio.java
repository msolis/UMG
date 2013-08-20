package ModeloLineal;

import Jama.Matrix;

public class Inicio {

	
	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// n datos
		int n = 7;
		
		double parametros[] = new double[2];
		parametros[0] = 1.15;
		parametros[1] = 3.3;
		
		
		// valos en el Eje X
		double Xs[] = new double[n];
		
		// valores quemados para X
		Xs[0] = 1.00;
		Xs[1] = 1.5;
		Xs[2] = 2;
		Xs[3] = 2.5;
		Xs[4] = 3;
		Xs[5] = 3.5;
		Xs[6] = 4;
		
		// valos en el Eje Y
		double Ys[] = new double[n];
		
		// valores quemados para X		
		Ys[0] = 0.2;
		Ys[1] = 1.6;
		Ys[2] = 2.1;
		Ys[3] = 2.6;
		Ys[4] = 3.1;
		Ys[5] = 3.6;
		Ys[6] = 4.1;
		
		// potencias para X
		int maximaPotenciaParaX = (n*2);
		
		// potencias de X inicia en X al cuadrado y termina en n*2
		double XkPotencias[][] = new double[maximaPotenciaParaX][n];
		
		// potencias de XY (X elevado a la potencia (p) por Y)
		double XYPotencias[][] = new double[n][n];
		
		// para sacar las potencias de X (n*2) 
		for (int p = 1; p <= maximaPotenciaParaX; p ++)
		{
			// i es para llenar el XkPotencia;
			int i = (p - 1);
			for (int item = 0; item < n; item++){
				XkPotencias[i][item] = Math.pow(Xs[item], p);
			}
		}
		
		// para sacar Xk*Y[dependiendo del modelo]
		for (int p = 1; p <= n; p++){
			int columnaActual = p - 1;
			for (int item = 0; item < n; item++){
				// Si es 1 se multiplica el X * Y
				XYPotencias[columnaActual][item] = Math.pow(Xs[item], p) * Ys[item];
			}
		}
		
		double acumulado = 0.0;
		double sumXs[] = new double[n*2];
		
		for(int p = 0; p <= (n*2)-1; p++){
			acumulado = 0;
			for (int item = 0; item < n; item++){
				// Si es 1 se multiplica el X * Y
				/*if (p == 0){
					acumulado += Xs[item];
				}else{*/
				acumulado += XkPotencias[p][item];
				//}
			}
			sumXs[p] = acumulado;
		}
		
		double sumXYs[] = new double[n];
		
		for(int p = 0; p < n; p++){
			acumulado = 0;
			for (int item = 0; item < n; item++){
				// Si es 1 se multiplica el X * Y
				if (p == 0){
					acumulado += Ys[item];
				}else{
					acumulado += XYPotencias[p-1][item];
				}
			}
			sumXYs[p] = acumulado;
		}
		
		// POTENCIA (Y-Sum(Y), 2)
		double sumatoriaYmenosY = 0;
		double promedioY = 0;
		for (int i = 0; i < n; i++){
			promedioY += Ys[i];
		}
		promedioY = promedioY / n;
		
		//double promerioYmenosY = 0;
		//double Yk_YmenosY[] = new double[n];
		for (int i = 0; i < n; i++){
			sumatoriaYmenosY += Math.pow(Ys[i]-promedioY, 2);
		}
		
		/////////----------------------
		
		double[][] As = new double[n-1][n];
        double[][] Modelos = new double[n-1][n];
        double[] R_Cuadrado = new double[n];
        
        
        
		// modelos
		for (int modelo = 1; modelo < n; modelo++){
            
            //System.out.println();
            //System.out.println("Modelo " + modelo);
            for (int x = 0; x <= modelo; x++){
                int t = modelo+1;
                double[][] m = new double[t][t];

                for (int c = 0; c < t; c++){
                    for (int f = 0; f < t; f++){
                        if((c==(t-1)) && (f==(t-1))){
                            m[c][f] = n;
                        }
                        else{
                            m[c][f] = sumXs[((modelo*2)-1)-c-f];
                        }
                    }   
                }

                Matrix A = new Matrix(m);
                double denominador = A.det();
                
                double[][] mArriba = new double[t][t];
                mArriba = m;

                for (int i = 0; i < t; i++){
                    mArriba[t-(x+1)][i] = sumXYs[((modelo))-i];
                }
                Matrix A2 = new Matrix(mArriba);
                double numerador = A2.det();
                
                //System.out.println("A" + x  + " = " + (numerador /denominador));
                As[modelo-1][x] = (numerador/denominador);
            }
            
            //System.out.println();
            double superAcumuladoDelModelo = 0;
            for (int y = 0; y < n; y++){
                double acum = 0;
                double valor = 0;
                String formula = "";
                for (int aes = 0; aes <= modelo; aes++){
                	
                    if (aes == 0){
                    	valor = As[modelo-1][aes];
                    	formula = "a" + aes;
                        acum = As[modelo-1][aes];
                    }
                    else{
                    	valor = As[modelo-1][aes];
                    	formula += " + (a" + aes;
                    	valor = XkPotencias[aes-1][y];
                    	formula += " * Xk^" + (y+1) + ") ";
                        acum += (As[modelo-1][aes] * XkPotencias[aes-1][y]);
                    }   
                    
                }
                Modelos[modelo-1][y] = acum;
                formula += " = " + acum;
                superAcumuladoDelModelo += acum;
                
                //imprime la formula
                //System.out.println("formula y = " + formula);
            }
            
            double promedioDelModelo = 0;
            promedioDelModelo = (superAcumuladoDelModelo / n);
            
            double SumatoriaDelModeloMmenosM = 0;
            
            for (int y = 0; y < n; y++){
            	//M_M_Cuadrados[modelo-1][y] = Math.pow((Modelos[modelo-1][y]-promedioDelModelo), 2);
            	SumatoriaDelModeloMmenosM += Math.pow((Modelos[modelo-1][y]-promedioDelModelo), 2);
            }
            
            R_Cuadrado[modelo-1] = (SumatoriaDelModeloMmenosM / sumatoriaYmenosY);
            
            
		}
		
		
		double Para_Los_Parametros[][] = new double[parametros.length][n];
		
		for(int param = 0; param < parametros.length; param++){
			System.out.println("Parametro " + parametros[param]);
			for (int modelo = 1; modelo < n; modelo++){
		        double acum = 0;
                for (int aes = 0; aes <= modelo; aes++){
                    if (aes == 0){
                    	acum = As[modelo-1][aes];
                    }
                    else{
                    	acum += (As[modelo-1][aes] * Math.pow(parametros[param], (aes)));
                    }   
                    
                }
                Para_Los_Parametros[param][modelo-1] = (R_Cuadrado[modelo-1] * acum);
                //System.out.println("Y para  " + Para_Los_Parametros[param][modelo-1]);
	        }
			
			double acumuladoYParaParametros = 0;
			for (int xx = 0; xx < n; xx++){
				acumuladoYParaParametros += Para_Los_Parametros[param][xx];
			}
			System.out.println("sum = " + acumuladoYParaParametros);
			System.out.println("Parametro Sum " + parametros[param] + " = " + (acumuladoYParaParametros/ (n-1)));
		}
		
		
		
		
		
		/*for (int ii = 0;ii < n-1; ii++){
            System.out.println("M" + ii + 1);
            for (int aa = 0;aa < n; aa++){
                System.out.println(Ms[ii][aa]);
            }
        }*/
        System.out.println();
        
	}

}
