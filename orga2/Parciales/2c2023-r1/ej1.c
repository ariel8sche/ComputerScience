#include "ej1.h"

string_proc_list* string_proc_list_create(void){
	string_proc_list* new_list = (string_proc_list*)malloc(sizeof(string_proc_list));
	new_list->first = NULL;
	new_list->last = NULL;

	return new_list; 
}

string_proc_node* string_proc_node_create(uint8_t type, char* hash){
	string_proc_node* new_node = (string_proc_node*)malloc(sizeof(string_proc_node));
	new_node->next = NULL;
	new_node->previous = NULL;
	new_node->type = type;
	new_node->hash = hash;

	return new_node;
}

void string_proc_list_add_node(string_proc_list* list, uint8_t type, char* hash){
	string_proc_node* new_node = string_proc_node_create(type, hash);
	if(list->last == NULL){		// Si es el primer elemento que se agrega a la lista lo hago first y last
		list->first = new_node;
		list->last = new_node;
	} else {
		list->last->next = new_node;
		new_node->previous = list->last;
		list->last = new_node;
	}
	
	return;
}

char* string_proc_list_concat(string_proc_list* list, uint8_t type , char* hash){
	string_proc_node* it = list->first;
	while(it != NULL){
		if(it->type == type){
			hash = str_concat(hash, it->hash);
		}
		it = it->next;
	}
	return hash;
}


/** AUX FUNCTIONS **/

void string_proc_list_destroy(string_proc_list* list){

	/* borro los nodos: */
	string_proc_node* current_node	= list->first;
	string_proc_node* next_node		= NULL;
	while(current_node != NULL){
		next_node = current_node->next;
		string_proc_node_destroy(current_node);
		current_node	= next_node;
	}
	/*borro la lista:*/
	list->first = NULL;
	list->last  = NULL;
	free(list);
}
void string_proc_node_destroy(string_proc_node* node){
	node->next      = NULL;
	node->previous	= NULL;
	node->hash		= NULL;
	node->type      = 0;			
	free(node);
}


char* str_concat(char* a, char* b) {
	int len1 = strlen(a);
    int len2 = strlen(b);
	int totalLength = len1 + len2;
    char *result = (char *)malloc(totalLength + 1); 
    strcpy(result, a);
    strcat(result, b);
    return result;  
}

void string_proc_list_print(string_proc_list* list, FILE* file){
        uint32_t length = 0;
        string_proc_node* current_node  = list->first;
        while(current_node != NULL){
                length++;
                current_node = current_node->next;
        }
        fprintf( file, "List length: %d\n", length );
		current_node    = list->first;
        while(current_node != NULL){
                fprintf(file, "\tnode hash: %s | type: %d\n", current_node->hash, current_node->type);
                current_node = current_node->next;
        }
}