package controllers;

import java.util.Arrays;

import com.jamonapi.utils.Logger;

import models.datos;
import play.mvc.Controller;

public class modelo3d extends Controller {

	public static void Index() {

		render();

	}

	public static double[] CUADRATICO_reemplazo;
	public static double[] LINEAL_reemplazo;

	public static double[][] copyMatrix(double[][] old) {

		double[][] current = new double[old.length][old[0].length];
		for (int i = 0; i < old.length; i++)
			for (int j = 0; j < old[i].length; j++) {
				current[i][j] = old[i][j];
				// System.out.println( old[i][j]);
			}

		return current;

	}

	public static void Procesar(datos d) {

		d.n = d.x1.length;
		d.matriz = new Double[d.n][25];

		Double _sum_Xk1 = 0.00;
		Double _sum_Xk2 = 0.00;
		Double _sum_z = 0.00;
		Double _sum_Xk1_2 = 0.00;
		Double _sum_Xk1_3 = 0.00;
		Double _sum_Xk1_4 = 0.00;
		Double _sum_Xk2_2 = 0.00;
		Double _sum_Xk2_3 = 0.00;
		Double _sum_Xk2_4 = 0.00;
		Double _sum_Xk1__Xk2 = 0.00;
		Double _sum_Xk1_2__Xk2_2 = 0.00;
		Double _sum_Xk1_2__Xk2 = 0.00;
		Double _sum_Xk1__Xk2_2 = 0.00;
		Double _sum_Xk1_3__Xk2 = 0.00;
		Double _sum_Xk1__Xk2_3 = 0.00;
		Double _sum_Xk1__z = 0.00;
		Double _sum_Xk2__z = 0.00;
		Double _sum_Xk1_2__z = 0.00;
		Double _sum_Xk2_2__z = 0.00;
		Double _sum_Xk1__Xk2__z = 0.00;

		// recorre las filas
		for (int i = 0; i < d.n; i++) {

			Double Xk1 = d.x1[i];
			Double Xk2 = d.x2[i];
			Double z = d.z[i];
			Double Xk1_2 = Math.pow(Xk1, 2);
			Double Xk1_3 = Math.pow(Xk1, 3);
			Double Xk1_4 = Math.pow(Xk1, 4);
			Double Xk2_2 = Math.pow(Xk2, 2);
			Double Xk2_3 = Math.pow(Xk2, 3);
			Double Xk2_4 = Math.pow(Xk2, 4);
			Double Xk1__Xk2 = (Xk1 * Xk2);
			Double Xk1_2__Xk2_2 = (Xk1_2 * Xk2_2);
			Double Xk1_2__Xk2 = (Xk1_2 * Xk2);
			Double Xk1__Xk2_2 = (Xk1 * Xk2_2);
			Double Xk1_3__Xk2 = (Xk1_3 * Xk2);
			Double Xk1__Xk2_3 = (Xk1 * Xk2_3);
			Double Xk1__z = (Xk1 * z);
			Double Xk2__z = (Xk2 * z);
			Double Xk1_2__z = (Xk1_2 * z);
			Double Xk2_2__z = (Xk2_2 * z);
			Double Xk1__Xk2__z = (Xk1 * Xk2 * z);

			_sum_Xk1 += Xk1;
			_sum_Xk2 += Xk2;
			_sum_z += z;
			_sum_Xk1_2 += Xk1_2;
			_sum_Xk1_3 += Xk1_3;
			_sum_Xk1_4 += Xk1_4;
			_sum_Xk2_2 += Xk2_2;
			_sum_Xk2_3 += Xk2_3;
			_sum_Xk2_4 += Xk2_4;
			_sum_Xk1__Xk2 += Xk1__Xk2;
			_sum_Xk1_2__Xk2_2 += Xk1_2__Xk2_2;
			_sum_Xk1_2__Xk2 += Xk1_2__Xk2;
			_sum_Xk1__Xk2_2 += Xk1__Xk2_2;
			_sum_Xk1_3__Xk2 += Xk1_3__Xk2;
			_sum_Xk1__Xk2_3 += Xk1__Xk2_3;
			_sum_Xk1__z += Xk1__z;
			_sum_Xk2__z += Xk2__z;
			_sum_Xk1_2__z += Xk1_2__z;
			_sum_Xk2_2__z += Xk2_2__z;
			_sum_Xk1__Xk2__z += Xk1__Xk2__z;

			d.matriz[i][0] = Xk1; // x1
			d.matriz[i][1] = Xk2; // x2
			d.matriz[i][2] = z; // z

			d.matriz[i][3] = Xk1_2; // Xk1^2
			d.matriz[i][4] = Xk1_3; // Xk1^3
			d.matriz[i][5] = Xk1_4; // Xk1^4

			d.matriz[i][6] = Xk2_2; // Xk2^2
			d.matriz[i][7] = Xk2_3; // Xk2^3
			d.matriz[i][8] = Xk2_4; // Xk2^4

			d.matriz[i][9] = Xk1__Xk2; // Xk1Xk2
			d.matriz[i][10] = Xk1_2__Xk2_2; // Xk1^2Xk2^2
			d.matriz[i][11] = Xk1_2__Xk2; // Xk1^2Xk2
			d.matriz[i][12] = Xk1__Xk2_2; // Xk1Xk2^2
			d.matriz[i][13] = Xk1_3__Xk2; // Xk1^3Xk2
			d.matriz[i][14] = Xk1__Xk2_3; // Xk1Xk2^3
			d.matriz[i][15] = Xk1__z; // Xk1Zk
			d.matriz[i][16] = Xk2__z; // Xk2Zk
			d.matriz[i][17] = Xk1_2__z; // Xk1^2Z
			d.matriz[i][18] = Xk2_2__z; // Xk2^2Zk
			d.matriz[i][19] = Xk1__Xk2__z; // Xk1Xk2Z

		}

		/* ************************************************************
		 * ******************** LINEAL ****************************
		 * ************************************************************
		 */
		double[][] LINEAL_matrix_for_determinats = {
				{ _sum_Xk1_2, _sum_Xk1__Xk2, _sum_Xk1 },
				{ _sum_Xk1__Xk2, _sum_Xk2_2, _sum_Xk2 },
				{ _sum_Xk1, _sum_Xk2, d.n } };

		LINEAL_reemplazo = new double[] { _sum_Xk1__z, _sum_Xk2__z, _sum_z };

		Jama.Matrix m = new Jama.Matrix(LINEAL_matrix_for_determinats);
		Double determinante = m.det();
		System.out.println();

		double[][] LINEAL_matrix_a0 = copyMatrix(LINEAL_matrix_for_determinats);
		for (int i = 0; i < LINEAL_matrix_a0.length; i++) {
			LINEAL_matrix_a0[i][0] = LINEAL_reemplazo[i];
		}
		d.LINEAL_a1 = new Jama.Matrix(LINEAL_matrix_a0).det();
		d.LINEAL_a1 = (d.LINEAL_a1 / determinante);

		System.out.println("a1 = " + d.LINEAL_a1);

		double[][] LINEAL_matrix_a1 = copyMatrix(LINEAL_matrix_for_determinats);
		for (int i = 0; i < LINEAL_matrix_a1.length; i++) {
			LINEAL_matrix_a1[i][1] = LINEAL_reemplazo[i];
		}
		d.LINEAL_a2 = new Jama.Matrix(LINEAL_matrix_a1).det();
		d.LINEAL_a2 = (d.LINEAL_a2 / determinante);
		System.out.println("a2 = " + d.LINEAL_a2);

		double[][] LINEAL_matrix_a2 = copyMatrix(LINEAL_matrix_for_determinats);
		for (int i = 0; i < LINEAL_matrix_a2.length; i++) {
			LINEAL_matrix_a2[i][2] = LINEAL_reemplazo[i];
		}
		d.LINEAL_a0 = new Jama.Matrix(LINEAL_matrix_a2).det();
		d.LINEAL_a0 = (d.LINEAL_a0 / determinante);
		System.out.println("a0 = " + d.LINEAL_a0);

		System.out.println();
		System.out.println();

		Double _sum_Zkm = 0.0;
		Double _sum_Zkm_Zk___2 = 0.0;
		Double _sum_Zml_Zml__2 = 0.0;
		for (int i = 0; i < d.n; i++) {
			Double Xk1 = d.x1[i];
			Double Xk2 = d.x2[i];

			d.matriz[i][20] = (d.LINEAL_a1 * Xk1) + (d.LINEAL_a2 * Xk2)
					+ d.LINEAL_a0;
			_sum_Zkm += d.matriz[i][20];

		}
		for (int i = 0; i < d.n; i++) {

			Double Zkm = d.matriz[i][20];

			d.matriz[i][22] = Math.pow((d.z[i] - (_sum_z / d.n)), 2);
			d.matriz[i][23] = Math.pow((Zkm - (_sum_Zkm / d.n)), 2);

			_sum_Zkm_Zk___2 += d.matriz[i][22];
			_sum_Zml_Zml__2 += d.matriz[i][23];
		}

		/* ************************************************************
		 * ******************** CUADRATICO ****************************
		 * ************************************************************
		 */
		double[][] CUADRATICO_matrix_for_determinats = {
				{ _sum_Xk1_4, _sum_Xk1_2__Xk2_2, _sum_Xk1_3__Xk2, _sum_Xk1_3,
						_sum_Xk1_2__Xk2, _sum_Xk1_2 },
				{ _sum_Xk1_2__Xk2_2, _sum_Xk2_4, _sum_Xk1__Xk2_3,
						_sum_Xk1__Xk2_2, _sum_Xk2_3, _sum_Xk2_2 },
				{ _sum_Xk1_3__Xk2, _sum_Xk1__Xk2_3, _sum_Xk1_2__Xk2_2,
						_sum_Xk1_2__Xk2, _sum_Xk1__Xk2_2, _sum_Xk1__Xk2 },
				{ _sum_Xk1_3, _sum_Xk1__Xk2_2, _sum_Xk1_2__Xk2, _sum_Xk1_2,
						_sum_Xk1__Xk2, _sum_Xk1 },
				{ _sum_Xk1_2__Xk2, _sum_Xk2_3, _sum_Xk1__Xk2_2, _sum_Xk1__Xk2,
						_sum_Xk2_2, _sum_Xk2 },
				{ _sum_Xk1_2, _sum_Xk2_2, _sum_Xk1__Xk2, _sum_Xk1, _sum_Xk2,
						d.n } };

		CUADRATICO_reemplazo = new double[] { _sum_Xk1_2__z, _sum_Xk2_2__z,
				_sum_Xk1__Xk2__z, _sum_Xk1__z, _sum_Xk2__z, _sum_z };

		m = new Jama.Matrix(CUADRATICO_matrix_for_determinats);
		determinante = m.det();

		double[][] matrix_a0 = copyMatrix(CUADRATICO_matrix_for_determinats);
		for (int i = 0; i < matrix_a0.length; i++) {
			matrix_a0[i][5] = CUADRATICO_reemplazo[i];
		}
		d.CUADRATICO_a0 = new Jama.Matrix(matrix_a0).det();
		d.CUADRATICO_a0 = (d.CUADRATICO_a0 / determinante);
		System.out.println("a0 = " + d.CUADRATICO_a0);

		double[][] matrix_a1 = copyMatrix(CUADRATICO_matrix_for_determinats);
		for (int i = 0; i < matrix_a1.length; i++) {
			matrix_a1[i][0] = CUADRATICO_reemplazo[i];
		}

		d.CUADRATICO_a1 = new Jama.Matrix(matrix_a1).det();
		d.CUADRATICO_a1 = (d.CUADRATICO_a1 / determinante);

		System.out.println("A1 = " + d.CUADRATICO_a1);

		double[][] matrix_a2 = copyMatrix(CUADRATICO_matrix_for_determinats);
		for (int i = 0; i < matrix_a2.length; i++) {
			matrix_a2[i][1] = CUADRATICO_reemplazo[i];
		}
		d.CUADRATICO_a2 = new Jama.Matrix(matrix_a2).det();
		d.CUADRATICO_a2 = (d.CUADRATICO_a2 / determinante);
		System.out.println("A2 = " + d.CUADRATICO_a2);

		double[][] matrix_a3 = copyMatrix(CUADRATICO_matrix_for_determinats);
		for (int i = 0; i < matrix_a3.length; i++) {
			matrix_a3[i][2] = CUADRATICO_reemplazo[i];
		}
		d.CUADRATICO_a3 = new Jama.Matrix(matrix_a3).det();
		d.CUADRATICO_a3 = (d.CUADRATICO_a3 / determinante);
		System.out.println("a3 = " + d.CUADRATICO_a3);

		double[][] matrix_a4 = copyMatrix(CUADRATICO_matrix_for_determinats);
		for (int i = 0; i < matrix_a4.length; i++) {
			matrix_a4[i][3] = CUADRATICO_reemplazo[i];
		}
		d.CUADRATICO_a4 = new Jama.Matrix(matrix_a4).det();
		d.CUADRATICO_a4 = (d.CUADRATICO_a4 / determinante);
		System.out.println("a4 = " + d.CUADRATICO_a4);

		double[][] matrix_a5 = copyMatrix(CUADRATICO_matrix_for_determinats);
		for (int i = 0; i < matrix_a5.length; i++) {
			matrix_a5[i][4] = CUADRATICO_reemplazo[i];
		}
		d.CUADRATICO_a5 = new Jama.Matrix(matrix_a5).det();
		d.CUADRATICO_a5 = (d.CUADRATICO_a5 / determinante);
		System.out.println("a5 = " + d.CUADRATICO_a5);

		Double _sum_Zkm_2 = 0.0;
		Double _sum_Zmc_Zmc__2 = 0.0;
		for (int i = 0; i < d.n; i++) {

			Double Xk1 = d.x1[i];
			Double Xk2 = d.x2[i];
			Double Xk1_2 = Math.pow(Xk1, 2);
			Double Xk2_2 = Math.pow(Xk2, 2);
			Double Xk1__Xk2 = (Xk1 * Xk2);

			d.matriz[i][21] = (d.CUADRATICO_a0 + (d.CUADRATICO_a1 * Xk1_2)
					+ (d.CUADRATICO_a2 * Xk2_2) + (d.CUADRATICO_a3 * Xk1__Xk2)
					+ (d.CUADRATICO_a4 * Xk1) + (d.CUADRATICO_a5 * Xk2));
			_sum_Zkm_2 += d.matriz[i][20];

		}
		for (int i = 0; i < d.n; i++) {
			d.matriz[i][24] = Math.pow((d.matriz[i][21] - (_sum_Zkm_2 / d.n)),
					2);
			_sum_Zmc_Zmc__2 += d.matriz[i][24];
		}

		d.R_2__1 = ((_sum_Zml_Zml__2 / _sum_Zkm_Zk___2) * 100.00);
		d.R_2__2 = ((_sum_Zmc_Zmc__2 / _sum_Zkm_Zk___2) * 100.00);

		d.R__1 = (Math.sqrt(d.R_2__1) * 10.00);
		d.R__2 = (Math.sqrt(d.R_2__2) * 10.00);

		System.out.println("R_2__1 = " + d.R_2__1);
		System.out.println("R_2__2 = " + d.R_2__2);

		System.out.println("R_1 = " + d.R__1);
		System.out.println("R_2 = " + d.R__2);

		if (d.LINEAL_param_X1 != null) {
			d.LINEAL_param_Y = new double[d.LINEAL_param_X1.length];
			for (int i = 0; i < d.LINEAL_param_X1.length; i++) {
				d.LINEAL_param_Y[i] = (d.LINEAL_a1 * d.LINEAL_param_X1[i])
						+ (d.LINEAL_a2 * d.LINEAL_param_X2[i])
						+ d.LINEAL_a0;
			}
		}

		if (d.CUADRATICO_param_X1 != null) {
			d.CUADRATICO_param_Y = new double[d.CUADRATICO_param_X1.length];
			for (int i = 0; i < d.CUADRATICO_param_X1.length; i++) {
				d.CUADRATICO_param_Y[i] = (d.CUADRATICO_a0
						+ (d.CUADRATICO_a1 * Math.pow(
								d.CUADRATICO_param_X1[i], 2))
						+ (d.CUADRATICO_a2 * Math.pow(
								d.CUADRATICO_param_X2[i], 2))
						+ (d.CUADRATICO_a3 * (d.CUADRATICO_param_X1[i] * d.CUADRATICO_param_X2[i]))
						+ (d.CUADRATICO_a4 * d.CUADRATICO_param_X1[i]) + (d.CUADRATICO_a5 * d.CUADRATICO_param_X2[i]));
			}
		}

		render(d);
	}

	//
	//
	// public static void Procesar(datos d){
	//
	// d.n = d.x1.length;
	// d.matriz = new Double[d.n][25];
	//
	// // recorre las filas
	// for (int i = 0; i < d.n; i++){
	//
	// Double Xk1 = d.x1[i];
	// Double Xk2 = d.x2[i];
	// Double z = d.z[i];
	//
	// Double Xk1_2 = Math.pow(Xk1, 2);
	// Double Xk1_3 = Math.pow(Xk1, 3);
	// Double Xk1_4 = Math.pow(Xk1, 4);
	//
	// Double Xk2_2 = Math.pow(Xk2, 2);
	// Double Xk2_3 = Math.pow(Xk2, 3);
	// Double Xk2_4 = Math.pow(Xk2, 4);
	//
	// Double Xk1__Xk2 = (Xk1 * Xk2);
	// Double Xk1_2__Xk2_2 = (Xk1_2 * Xk2_2);
	// Double Xk1_2__Xk2 = (Xk1_2 * Xk2);
	// Double Xk1__Xk2_2 = (Xk1 * Xk2_2);
	// Double Xk1_3__Xk2 = (Xk1_3 * Xk2);
	// Double Xk1__Xk2_3 = (Xk1 * Xk2_3);
	// Double Xk1__z = (Xk1 * z);
	// Double Xk2__z = (Xk2 * z);
	// Double Xk1_2__z = (Xk1_2 * z);
	// Double Xk2_2__z = (Xk2_2 * z);
	// Double Xk1__Xk2__z = (Xk1 * Xk2 * z);
	//
	// d.matriz[i][0] = Xk1; // x1
	// d.matriz[i][1] = Xk2; // x2
	// d.matriz[i][2] = z; // z
	//
	// d.matriz[i][3] = Xk1_2; //Xk1^2
	// d.matriz[i][4] = Xk1_3; //Xk1^3
	// d.matriz[i][5] = Xk1_4; //Xk1^4
	//
	// d.matriz[i][6] = Xk2_2; // Xk2^2
	// d.matriz[i][7] = Xk2_3; // Xk2^3
	// d.matriz[i][8] = Xk2_4; // Xk2^4
	//
	// d.matriz[i][9] = Xk1__Xk2; // Xk1Xk2
	// d.matriz[i][10] = Xk1_2__Xk2_2 ; //Xk1^2Xk2^2
	// d.matriz[i][11] = Xk1_2__Xk2 ; //Xk1^2Xk2
	// d.matriz[i][12] = Xk1__Xk2_2 ; //Xk1Xk2^2
	// d.matriz[i][13] = Xk1_3__Xk2 ; //Xk1^3Xk2
	// d.matriz[i][14] = Xk1__Xk2_3 ; //Xk1Xk2^3
	// d.matriz[i][15] = Xk1__z ; //Xk1Zk
	// d.matriz[i][16] = Xk2__z ; //Xk2Zk
	// d.matriz[i][17] = Xk1_2__z ; //Xk1^2Z
	// d.matriz[i][18] = Xk2_2__z ; //Xk2^2Zk
	// d.matriz[i][19] = Xk1__Xk2__z ; //Xk1Xk2Z
	//
	// double[][] matrix_for_determinats = {
	// {Xk1_4, Xk1_2__Xk2_2, Xk1_3__Xk2, Xk1_3, Xk1_2__Xk2, Xk1_2},
	// {Xk1_2__Xk2_2, Xk2_4, Xk1__Xk2_3, Xk1__Xk2_2, Xk2_3, Xk2_2},
	// {Xk1_3__Xk2, Xk1__Xk2_3, Xk1_2__Xk2_2, Xk1_2__Xk2, Xk1__Xk2_2, Xk1__Xk2
	// },
	// {Xk1_3, Xk1__Xk2_2, Xk1_2__Xk2, Xk1_2, Xk1__Xk2, Xk1},
	// {Xk1_2__Xk2, Xk2_3, Xk1__Xk2_2, Xk1__Xk2, Xk2_2, Xk2},
	// {Xk1_2, Xk2_2, Xk1__Xk2, Xk1, Xk2, d.n}
	// };
	//
	//
	// double[][] reemplazo = {
	// { Xk1_2__z },
	// { Xk2_2__z},
	// { Xk1__Xk2__z },
	// { Xk1__z },
	// { Xk2__z },
	// { z }
	// };
	//
	// Matrix m = new Matrix(matrix_for_determinats);
	// Double determinante = m.det();
	//
	// double [][] matrix_a1 = matrix_for_determinats;
	//
	// for (int i = 0; i < matrix_a1.length; i++){
	// //matrix_a1[i][0]);
	//
	// }
	//
	// matrix_a1[0] = reemplazo[0];
	//
	//
	//
	// }
	//
	//
	// render(d);
	// }

}
