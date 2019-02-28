//
//  Shunting-Yard-Algorithm.m
//  Calculator
//
//  Created by S M HEMEL on 24/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

#import "Shunting-Yard-Algorithm.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#define CHECKMALLOC(var) if((var) == NULL) {printf("ERROR: malloc\n");abort();}
#define MAXOPSTACK 64
#define MAXNUMSTACK 64

@interface Shunting_Yard_Algorithm ()

@end

@implementation Shunting_Yard_Algorithm

- (void)viewDidLoad {
    self.expression = "";
    self.str_equation = [NSMutableString stringWithFormat:@""];
}
float numstack[MAXNUMSTACK];
struct operator_type *opstack[MAXOPSTACK];
char get_keypress() {
    return (char)getchar();
}

float eval_add(float a1, float a2) { return a1+a2; }
float eval_sub(float a1, float a2) { return a1-a2; }
float eval_uminus(float a1, float a2) { return -a1; }
float eval_exp(float a1, float a2) { return a2<0 ? 0 : (a2==0?1:a1*eval_exp(a1, a2-1)); }
float eval_mul(float a1, float a2) { return a1*a2; }
float eval_div(float a1, float a2) {
    if(!a2) {
        fprintf(stderr, "ERROR: Division by zero\n");
        exit(EXIT_FAILURE);
    }
    return a1/a2;
}
float eval_mod(float a1, float a2) {
    if(!a2) {
        fprintf(stderr, "ERROR: Division by zero\n");
        exit(EXIT_FAILURE);
    }
    return fmodf(a1, a2);
    //return a1%a2;
}
enum {ASSOC_NONE=0, ASSOC_LEFT, ASSOC_RIGHT};

struct operator_type {
    char op;
    int prec;
    int assoc;
    int unary;
    float (*eval)(float a1, float a2);
} operators[]={
    {'_', 10, ASSOC_RIGHT, 1, eval_uminus},
    {'^', 9,  ASSOC_RIGHT, 0, eval_exp},
    {'*', 8,  ASSOC_LEFT,  0, eval_mul},
    {'/', 8,  ASSOC_LEFT,  0, eval_div},
    {'%', 8,  ASSOC_LEFT,  0, eval_mod},
    {'+', 5,  ASSOC_LEFT,  0, eval_add},
    {'-', 5,  ASSOC_LEFT,  0, eval_sub},
    {'(', 0,  ASSOC_NONE,  0, NULL},
    {')', 0,  ASSOC_NONE,  0, NULL}
};
int nopstack=0;
int nnumstack=0;
struct operator_type *getop(char ch) {
    int i;
    for(i=0; i<sizeof operators/sizeof operators[0]; ++i) {
        if(operators[i].op==ch) return operators+i;
    }
    return NULL;
}
void push_opstack(struct operator_type *op)
{
    if(nopstack>MAXOPSTACK-1) {
        fprintf(stderr, "ERROR: Operator stack overflow\n");
        exit(EXIT_FAILURE);
    }
    opstack[nopstack++]=op;
}

struct operator_type *pop_opstack()
{
    if(!nopstack) {
        fprintf(stderr, "ERROR: Operator stack empty\n");
        exit(EXIT_FAILURE);
    }
    return opstack[--nopstack];
}

void push_numstack(float num)
{
    if(nnumstack>MAXNUMSTACK-1) {
        fprintf(stderr, "ERROR: Number stack overflow\n");
        exit(EXIT_FAILURE);
    }
    numstack[nnumstack++]=num;
}

float pop_numstack()
{
    if(!nnumstack) {
        fprintf(stderr, "ERROR: Number stack empty\n");
        exit(EXIT_FAILURE);
    }
    return numstack[--nnumstack];
}


void shunt_op(struct operator_type *op)
{
    struct operator_type *pop;
    float n1, n2;
    
    if(op->op=='(') {
        push_opstack(op);
        return;
        
    } else if(op->op==')') {
        while(nopstack>0 && opstack[nopstack-1]->op!='(') {
            pop=pop_opstack();
            n1=pop_numstack();
            
            if(pop->unary) push_numstack(pop->eval(n1, 0));
            else {
                n2=pop_numstack();
                push_numstack(pop->eval(n2, n1));
            }
        }
        
        if(!(pop=pop_opstack()) || pop->op!='(') {
            fprintf(stderr, "ERROR: Stack error. No matching \'(\'\n");
            exit(EXIT_FAILURE);
        }
        return;
    }
    
    if(op->assoc==ASSOC_RIGHT) {
        while(nopstack && op->prec<opstack[nopstack-1]->prec) {
            pop=pop_opstack();
            n1=pop_numstack();
            if(pop->unary) push_numstack(pop->eval(n1, 0));
            else {
                n2=pop_numstack();
                push_numstack(pop->eval(n2, n1));
            }
        }
    } else {
        while(nopstack && op->prec<=opstack[nopstack-1]->prec) {
            pop=pop_opstack();
            n1=pop_numstack();
            if(pop->unary) push_numstack(pop->eval(n1, 0));
            else {
                n2=pop_numstack();
                push_numstack(pop->eval(n2, n1));
            }
        }
    }
    push_opstack(op);
}

int isdigit_or_decimal(int c) {
    if (c == '.' || isdigit(c))
        return 1;
    else
        return 0;
}
void clear() {
    nopstack=0;
    nnumstack=0;
    for(int i=0; i<64; i++){
        numstack[i] = 0;
        opstack[i] = 0;
    }
}
-(NSString *) getAns:(int)size {
    clear();
    char *expr;
    char *tstart=NULL;
    struct operator_type startop={'X', 0, ASSOC_NONE, 0, NULL};
    struct operator_type *op=NULL;
    float n1, n2;
    struct operator_type *lastop=&startop;
    
    for (expr=_expression; *expr; ++expr) {
        if (!tstart) {
            if ((op=getop(*expr))) {
                
                if (lastop && (lastop == &startop || lastop->op != ')')) {
                    if (op->op == '-')
                        op=getop('_');
                    else if (op->op!='(') {
                        fprintf(stderr, "ERROR: Illegal use of binary operator (%c)\n", op->op);
                        exit(EXIT_FAILURE);
                    }
                }
                shunt_op(op);
                lastop=op;
            } else if (isdigit_or_decimal(*expr)) tstart = expr;
            else if (!isspace(*expr)) return @("Systax error");
        } else {
            if (isspace(*expr)) {
                push_numstack(atof(tstart));
                tstart=NULL;
                lastop=NULL;
            } else if ((op=getop(*expr))) {
                push_numstack(atof(tstart));
                tstart=NULL;
                shunt_op(op);
                lastop=op;
            } else if (!isdigit_or_decimal(*expr) ) return @("Systax error");
        }
    }
    if(tstart) push_numstack(atof(tstart));
    
    
    while(nopstack) {
        op=pop_opstack();
        n1=pop_numstack();
        if(op->unary) push_numstack(op->eval(n1, 0));
        else {
            n2=pop_numstack();
            push_numstack(op->eval(n2, n1));
        }
    }
    return @(numstack[0]).stringValue;
}

@end
